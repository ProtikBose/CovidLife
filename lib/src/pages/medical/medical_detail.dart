import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/model/dhanmondi/dhanmondi_hospital.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
//import 'package:flutter_healthcare_app/src/model/dactor_model.dart';
import 'package:flutter_healthcare_app/src/theme/text_styles.dart';
import 'package:flutter_healthcare_app/src/theme/theme.dart';
import 'package:flutter_healthcare_app/src/theme/extention.dart';
import 'package:flutter_healthcare_app/src/widgets/progress_widget.dart';
import 'package:flutter_healthcare_app/src/widgets/rating_start.dart';
import 'package:url_launcher/url_launcher.dart';

class HospitalDetailPage extends StatefulWidget {
  HospitalDetailPage({Key key, this.model}) : super(key: key);
  final HospitalModel model;

  @override
  _HospitalDetailPageState createState() => _HospitalDetailPageState();
}

class _HospitalDetailPageState extends State<HospitalDetailPage> {
  HospitalModel model;
  @override
  void initState() {
    model = widget.model;
    super.initState();
  }

  Widget _appbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        BackButton(color: Theme.of(context).primaryColor),
        IconButton(
            icon: Icon(
              model.isfavourite ? Icons.favorite : Icons.favorite_border,
              color: model.isfavourite ? Colors.red : LightColor.grey,
            ),
            onPressed: () {
              setState(() {
                model.isfavourite = !model.isfavourite;
              });
            })
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = TextStyles.title.copyWith(fontSize: 25).bold;
    if (AppTheme.fullWidth(context) < 393) {
      titleStyle = TextStyles.title.copyWith(fontSize: 23).bold;
    }
    return Scaffold(
      backgroundColor: LightColor.extraLightBlue,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Image.asset(model.image),
            DraggableScrollableSheet(
              maxChildSize: .8,
              initialChildSize: .6,
              minChildSize: .6,
              builder: (context, scrollController) {
                return Container(
                  height: AppTheme.fullHeight(context) * .5,
                  padding: EdgeInsets.only(
                      left: 19,
                      right: 19,
                      top: 16), //symmetric(horizontal: 19, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    model.name,
                                    style: titleStyle,
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.check_circle,
                                  size: 18,
                                  color: Theme.of(context).primaryColor),
                              Spacer(),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 3.25,
                                child: RatingStar(
                                  rating: model.rating,
                                ),
                              )
                            ],
                          ),
                          subtitle: Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                model.address,
                                style: TextStyles.bodySm.subTitleColor.bold,
                              )),
                        ),
                        Divider(
                          thickness: .3,
                          color: LightColor.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: LightColor.grey.withAlpha(150)),
                              child: Icon(
                                Icons.call,
                                color: Colors.white,
                              ),
                            ).ripple(
                              () {
                                launch("tel:" + model.phone);
                              },
                              borderRadius: BorderRadius.circular(10),
                            ),
                            /*
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 20,
                            ),
                            */
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: LightColor.grey.withAlpha(150)),
                              child: Icon(
                                Icons.chat_bubble,
                                color: Colors.white,
                              ),
                            ).ripple(
                              () {
                                launch("sms:" + model.phone);
                              },
                              borderRadius: BorderRadius.circular(10),
                            ),
                            /*
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 20,
                            ),
                            */
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * (3 / 5),
                                child: FlatButton(
                                  color: Theme.of(context).primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  onPressed: () {
                                    final scaffold = Scaffold.of(context);
                                    scaffold.showSnackBar(SnackBar(
                                      content: new Text(
                                          'কার্যক্রম আপাতত বন্ধ রয়েছে'),
                                      duration: new Duration(seconds: 2),
                                    ));
                                  },
                                  child: Text(
                                    "যোগাযোগ করুন",
                                    style: TextStyles.titleNormal.white,
                                  ).p(10),
                                )),
                          ],
                        ).vP16,
                        Divider(
                          thickness: .3,
                          color: LightColor.grey,
                        ),
                        Text("About", style: titleStyle).vP16,
                        Text(
                          model.description,
                          style: TextStyles.body.subTitleColor,
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Row(children: [
                          Text("Hours :  ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18)),
                          Text(model.hours,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.green))
                        ]),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(children: [
                          Text("Phone :  ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18)),
                          Text(model.phone, style: TextStyle(fontSize: 18))
                        ]),
                        SizedBox(
                          height: 25.0,
                        ),
                        if (!model.isfavourite)
                          Row(children: [
                            Icon(
                              Icons.verified_user,
                              color: Colors.green,
                            ),
                            Padding(padding: EdgeInsets.only(left: 7)),
                            Text("COVID-19 testing center",
                                style: TextStyle(fontSize: 18))
                          ]),
                      ],
                    ),
                  ),
                );
              },
            ),
            _appbar(),
          ],
        ),
      ),
    );
  }
}

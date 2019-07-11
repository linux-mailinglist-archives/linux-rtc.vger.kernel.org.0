Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7469654EE
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Jul 2019 13:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728371AbfGKLEd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 11 Jul 2019 07:04:33 -0400
Received: from mail-eopbgr60075.outbound.protection.outlook.com ([40.107.6.75]:4571
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728024AbfGKLEc (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 11 Jul 2019 07:04:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gd3QGOkcGdGIxqidX4TkJrgPg4/KIdVRM77GD3KyyR5j/NNqiVNIMAHz4UWpkyejm1Wf+rTZb+Hs5Nrcvsn72O3yadU0UNLk93lRUppf3wTe2YlP3lYdFkMmP5TCKSFCQYeeRkck09CiM5grgjzdhQpa1lxXmcytw2UBv9QqiC+2L8JJqk/azGJU/bMYLz6PDI7nkzAQDPI33A7UnIZrlbvnnP2rruTlEXWwLiqXmopUulQTs4V4ffwOhbJMNMZuS50TTsTjWeifPEey0T3e878qI88aeSstYu33k1f7B+n6c5raclTDL6CjNxt8r/OaqcBV6BQeu0TqAZYqdTtgaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5X0PyciOiA5tPFvejIaeavzOtq00YHEkyuEwtYIxGVw=;
 b=Zi44wcwyjgozJYOc2ZuCv+AgAZAh3rBiFrjT6SDB07lKs8jeTk2qqnY541JOPpnQPEKqkCzECAR4nvsVE5+aIA9fYg82nc6c6e6sUI1eoUwc3swLPWvvf8ex7z9OvPdy0U/TvaK0pP7cN+m2aLhA4ulnXYswY9AUNRHF5vCbn31aHIpsyn1950aeU5PjLHuTvEyPq7VIsZSLgkQutW8TwbJSQKkzKtoyLQlumYfW6C+/HAosJ2MqRXukT6q0/V0oID1vkYI4nzCNfSkr+T+DQPP2Z1P8fhfLCFfwPANaq0Fsdjx23gNPbhRgX17E3dhBG6pnNjTi5jspRlaLy1A2SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5X0PyciOiA5tPFvejIaeavzOtq00YHEkyuEwtYIxGVw=;
 b=hNFVMCRMVzHKSWPZTPBQstRiZUn5BSouRBWP79rnJpU78m2+FqkipLw0UXodzoi0gosXEuiODnBR/bKwF6R6tRduTwhwLejI4iTiN1bMDka7ZFqNK18vBNtgNZbueBsOOcQanf1P9Kr5KSjTsqXrcTw/hPFbnA7t4HmpKRNZPm4=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4441.eurprd04.prod.outlook.com (52.135.137.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Thu, 11 Jul 2019 11:04:27 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::413e:84ea:f3bb:40bd]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::413e:84ea:f3bb:40bd%5]) with mapi id 15.20.2073.008; Thu, 11 Jul 2019
 11:04:27 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Rob Herring <robh+dt@kernel.org>, Leo Li <leoyang.li@nxp.com>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
        Xiaobo Xie <xiaobo.xie@nxp.com>,
        Jiafei Pan <jiafei.pan@nxp.com>, Ran Wang <ran.wang_1@nxp.com>
Subject: RE: [EXT] Re: [v2,2/2] Documentation: dt: binding: rtc: add binding
 for ftm alarm driver
Thread-Topic: [EXT] Re: [v2,2/2] Documentation: dt: binding: rtc: add binding
 for ftm alarm driver
Thread-Index: AQHVNxCMhcL7bcNfD0yZEhCl0RK1ZqbEQg8AgAALOwCAAGHlkA==
Date:   Thu, 11 Jul 2019 11:04:26 +0000
Message-ID: <DB7PR04MB4490EC6173C05930B15FD7D68FF30@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190710110424.4254-1-biwen.li@nxp.com>
 <20190710110424.4254-2-biwen.li@nxp.com>
 <CADRPPNQ8nZQYq1ZXZ368LLeKnyrXpjB_X8XaHVhW890bw-tU6A@mail.gmail.com>
 <CAL_JsqLr53neiaiOEpAcmAhDMnqCuxgPLC9qnFB2rZ4zRFxFLg@mail.gmail.com>
In-Reply-To: <CAL_JsqLr53neiaiOEpAcmAhDMnqCuxgPLC9qnFB2rZ4zRFxFLg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e4d437c-2748-4717-6b63-08d705ef8aa8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR04MB4441;
x-ms-traffictypediagnostic: DB7PR04MB4441:
x-microsoft-antispam-prvs: <DB7PR04MB444147F0B0EE3771E2C0ADD08FF30@DB7PR04MB4441.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0095BCF226
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(13464003)(189003)(199004)(8676002)(66476007)(66556008)(71200400001)(71190400001)(7696005)(64756008)(66946007)(66446008)(76176011)(8936002)(44832011)(4326008)(486006)(81156014)(6506007)(81166006)(53546011)(33656002)(256004)(14444005)(5660300002)(68736007)(478600001)(76116006)(14454004)(305945005)(55016002)(99286004)(6436002)(316002)(6246003)(102836004)(110136005)(54906003)(52536014)(25786009)(9686003)(186003)(74316002)(6636002)(7736002)(446003)(26005)(2906002)(86362001)(66066001)(11346002)(476003)(6116002)(3846002)(53936002)(229853002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB4441;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eFcb2CbvcG49vE479WRtp/Azz9R90mjYenT1XPQ7etd5zI1qG/plZOjV6HsomkZld97C9puH6OPUUnptisFWC51G4GeUblFcEr+qqagoVs6ipCzJt9OcXwltVaPHPtipOaZGMEZ0oEnEFO1yDON6BWhoBlnETYgWS2VxuF5V2hBWoJArLPLAA2dXwq5DNVzZ7VK8rs0f/aZiQC6F0+VeBjRTvj//V9nMl9/DyUntXVKPNrwngvBATAX1X91QqtoU7Trv4nMerA1s8jrKCI577jjT4aZ1WiYK/+HL0xdG7kxqJD2z/WV4IpT74xiIEo5phV4xsaKzDpjJs0vXxp+KcWAW+CGkC1Y21yogrf5Ys8ei8dsw/F5UXYqdwIX2yUW85I03Qe+keXthhu+WHIFWvWZouUCMAzh61WrTvDzgt5k=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e4d437c-2748-4717-6b63-08d705ef8aa8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2019 11:04:27.4552
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: biwen.li@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4441
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtl
cm5lbC5vcmc+IA0KU2VudDogMjAxOeW5tDfmnIgxMeaXpSA0OjI2DQpUbzogTGVvIExpIDxsZW95
YW5nLmxpQG54cC5jb20+DQpDYzogQml3ZW4gTGkgPGJpd2VuLmxpQG54cC5jb20+OyBBbGVzc2Fu
ZHJvIFp1bW1vIDxhLnp1bW1vQHRvd2VydGVjaC5pdD47IEFsZXhhbmRyZSBCZWxsb25pIDxhbGV4
YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT47IG9wZW4gbGlzdDpSRUFMIFRJTUUgQ0xPQ0sgKFJU
QykgU1VCU1lTVEVNIDxsaW51eC1ydGNAdmdlci5rZXJuZWwub3JnPjsgbGttbCA8bGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZz47IFhpYW9ibyBYaWUgPHhpYW9iby54aWVAbnhwLmNvbT47IEpp
YWZlaSBQYW4gPGppYWZlaS5wYW5AbnhwLmNvbT47IFJhbiBXYW5nIDxyYW4ud2FuZ18xQG54cC5j
b20+DQpTdWJqZWN0OiBbRVhUXSBSZTogW3YyLDIvMl0gRG9jdW1lbnRhdGlvbjogZHQ6IGJpbmRp
bmc6IHJ0YzogYWRkIGJpbmRpbmcgZm9yIGZ0bSBhbGFybSBkcml2ZXINCg0KQ2F1dGlvbjogRVhU
IEVtYWlsDQoNCk9uIFdlZCwgSnVsIDEwLCAyMDE5IGF0IDE6NDYgUE0gTGkgWWFuZyA8bGVveWFu
Zy5saUBueHAuY29tPiB3cm90ZToNCj4NCj4gT24gV2VkLCBKdWwgMTAsIDIwMTkgYXQgNjozNSBB
TSBCaXdlbiBMaSA8Yml3ZW4ubGlAbnhwLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBUaGUgcGF0Y2gg
YWRkcyBiaW5kaW5nIGZvciBmdG0gYWxhcm0gZHJpdmVyDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBCaXdlbiBMaSA8Yml3ZW4ubGlAbnhwLmNvbT4NCj4NCj4gTG9va3MgbGlrZSBJIGNvbW1lbnRl
ZCB0aGUgb2xkZXIgdmVyc2lvbiBqdXN0IG5vdy4gIEFkZGluZyBSb2IgdG8gdGhpcyANCj4gdmVy
c2lvbiB0b28uDQoNCk1vcmUgaW1wb3J0YW50bHksIHJlLXNlbmQgdGhlIHBhdGNoIHRvIHRoZSBE
VCBsaXN0IHNvIHBhdGNod29yayB0cmFja3MgaXQuDQpbQml3ZW4gTGldIG9rLCBJIHdpbGwgc2Vu
ZCB0aGUgcGF0Y2ggdG8gdGhlIERUIGxpc3QgaW4gdjMuDQoNCj4NCj4gPiAtLS0NCj4gPiBDaGFu
Z2UgaW4gdjI6DQo+ID4gICAgIC0gcmVwbGFjZSBsczEwNDNhIHdpdGggbHMxMDg4YSBhcyBleGFt
cGxlDQo+ID4gICAgIC0gYWRkIHJjcG0gbm9kZSBhbmQgZnNsLHJjcG0td2FrZXVwIHByb3BlcnR5
DQo+ID4NCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcnRjL3J0Yy1mc2wtZnRtLWFsYXJt
LnR4dCAgfCA0MCANCj4gPiArKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCA0MCBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCANCj4gPiBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcnRjL3J0Yy1mc2wtZnRtLWFsYXJtLnR4dA0K
PiA+DQo+ID4gZGlmZiAtLWdpdCANCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9ydGMvcnRjLWZzbC1mdG0tYWxhcm0udHh0IA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3J0Yy9ydGMtZnNsLWZ0bS1hbGFybS50eHQNCj4gPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAuLjAxMDk4NGENCj4gPiAtLS0gL2Rldi9udWxs
DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3J0Yy9ydGMtZnNs
LWZ0bS1hbGFybS50eHQNCj4gPiBAQCAtMCwwICsxLDQwIEBADQo+ID4gK0ZyZWVzY2FsZSBGbGV4
VGltZXIgTW9kdWxlIChGVE0pIEFsYXJtDQo+ID4gKw0KPiA+ICtOb3RlOiBUaGUgZHJpdmVyIG5l
ZWQgd29yayB3aXRoIFJDUE0gZHJpdmVyIHRvIHdha2UgdXAgc3lzdGVtIGluIHNsZWVwLg0KPiA+
ICsNCj4gPiArUmVxdWlyZWQgcHJvcGVydGllczoNCj4gPiArDQo+ID4gKy0gY29tcGF0aWJsZSA6
IFNob3VsZCBiZSAiZnNsLGZ0bS1hbGFybSIgb3IgImZzbCw8Y2hpcD4tZnRtLWFsYXJtIiwgDQo+
ID4gK3RoZQ0KDQpmc2wsZnRtLWFsYXJtIHNob3VsZCBiZSBhIGZhbGxiYWNrLCBub3Qgb24gaXRz
IG93bi4NCltCaXdlbiBMaV0gb2ssSSB3aWxsIGRlbGV0ZSAiZnNsLGZ0bS1hbGFybSIgaW4gdjMu
DQoNCj4gPiArICAgICAgICAgICAgICBzdXBwb3J0ZWQgY2hpcHMgaW5jbHVkZQ0KPiA+ICsgICAg
ICAgICAgICAgICJmc2wsbHMxMDEyYS1mdG0tYWxhcm0iDQo+ID4gKyAgICAgICAgICAgICAgImZz
bCxsczEwMjFhLWZ0bS1hbGFybSINCj4gPiArICAgICAgICAgICAgICAiZnNsLGxzMTAyOGEtZnRt
LWFsYXJtIg0KPiA+ICsgICAgICAgICAgICAgICJmc2wsbHMxMDQzYS1mdG0tYWxhcm0iDQo+ID4g
KyAgICAgICAgICAgICAgImZzbCxsczEwNDZhLWZ0bS1hbGFybSINCj4gPiArICAgICAgICAgICAg
ICAiZnNsLGxzMTA4OGEtZnRtLWFsYXJtIg0KPiA+ICsgICAgICAgICAgICAgICJmc2wsbHMyMDh4
YS1mdG0tYWxhcm0iDQo+ID4gKy0gcmVnIDogU3BlY2lmaWVzIGJhc2UgcGh5c2ljYWwgYWRkcmVz
cyBhbmQgc2l6ZSBvZiB0aGUgcmVnaXN0ZXIgDQo+ID4gK3NldHMgZm9yIHRoZQ0KPiA+ICsgIEZs
ZXhUaW1lciBNb2R1bGUgYW5kIGJhc2UgcGh5c2ljYWwgYWRkcmVzcyBvZiBJUCBQb3dlcmRvd24g
DQo+ID4gK0V4Y2VwdGlvbiBDb250cm9sDQo+ID4gKyAgUmVnaXN0ZXIuDQo+ID4gKy0gcmVnLW5h
bWVzOiBuYW1lcyBvZiB0aGUgbWFwcGVkIG1lbW9yeSByZWdpb25zIGxpc3RlZCBpbiByZWdzIHBy
b3BlcnR5Lg0KPiA+ICsgIHNob3VsZCBpbmNsdWRlIHRoZSBmb2xsb3dpbmcgZW50cmllczoNCj4g
PiArICAiZnRtIjogICAgQWRkcmVzcyBvZiB0aGUgcmVnaXN0ZXIgc2V0cyBmb3IgRmxleFRpbWVy
IE1vZHVsZQ0KDQpTYXlzIHJlcXVpcmVkLCBidXQgbm90IGluIHRoZSBleGFtcGxlLiBJJ2QganVz
dCByZW1vdmUgdGhpcyBhcyAtbmFtZXMgaXMgcG9pbnRsZXNzIHdoZW4gdGhlcmUgaXMgb25seSAx
IGVudHJ5Lg0KW0Jpd2VuIExpXSBJIHdpbGwgcmVtb3ZlIHRoZSByZWctbmFtZXMgcHJvcGVydHkg
aW4gdjMuDQoNCj4gPiArLSBpbnRlcnJ1cHRzIDogU2hvdWxkIGJlIHRoZSBGbGV4VGltZXIgTW9k
dWxlIGludGVycnVwdC4NCj4gPiArLSBmc2wscmNwbS13YWtldXAgcHJvcGVydHkgYW5kIHJjcG0g
bm9kZSA6IFBsZWFzZSByZWZlcg0KPiA+ICsgICAgICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3NvYy9mc2wvcmNwbS50eHQNCj4NCj4gTG9va3MgYmV0dGVyLg0KPg0KPiA+ICst
IGJpZy1lbmRpYW46IElmIHRoZSBob3N0IGNvbnRyb2xsZXIgaXMgYmlnLWVuZGlhbiBtb2RlLCBz
cGVjaWZ5IHRoaXMgcHJvcGVydHkuDQo+ID4gKyAgVGhlIGRlZmF1bHQgZW5kaWFuIG1vZGUgaXMg
bGl0dGxlLWVuZGlhbi4NCj4NCj4gU2FtZSBjb21tZW50IGFib3V0IG9wdGlvbmFsIHByb3BlcnR5
Lg0KPiBbQml3ZW4gTGldIG9rLCBJIHdpbGwgbW92ZSBiaWctZW5kaWFuIHRvIG9wdGlvbmFsIHBy
b3BlcnR5IGluIHYzLiAgDQo+DQo+ID4gKw0KPiA+ICtFeGFtcGxlOg0KPiA+ICtyY3BtOiByY3Bt
QDFlMzQwNTAgew0KPiA+ICsgICAgICAgY29tcGF0aWJsZSA9ICJmc2wsbHMxMDg4YS1yY3BtIiwg
ImZzbCxxb3JpcS1yY3BtLTIuMSsiOw0KPiA+ICsgICAgICAgcmVnID0gPDB4MCAweDFlMzQwNTAg
MHgwIDB4ND47DQo+ID4gKyAgICAgICBmc2wsI3JjcG0td2FrZXVwLWNlbGxzID0gPDE+Ow0KDQox
IGNlbGwgaGVyZS4uLg0KW0Jpd2VuIExpXSB5ZXMsIGl04oCZcyB3cm9uZyxJIHdpbGwgY29ycmVj
dCBpdCBpbiB2My4NCj4gPiArfQ0KPiA+ICsNCj4gPiArZnRtX2FsYXJtMDogdGltZXJAMjgwMDAw
MCB7DQo+ID4gKyAgICAgICBjb21wYXRpYmxlID0gImZzbCxmdG0tYWxhcm0iOw0KPiA+ICsgICAg
ICAgcmVnID0gPDB4MCAweDI4MDAwMDAgMHgwIDB4MTAwMDA+Ow0KPiA+ICsgICAgICAgZnNsLHJj
cG0td2FrZXVwID0gPCZyY3BtIDB4MCAweDQwMDA+Ow0KDQouLi5hbmQgMiBjZWxscyBoZXJlLg0K
W0Jpd2VuIExpXSB5ZXMsIGl04oCZcyB3cm9uZyxJIHdpbGwgY29ycmVjdCBpdCBpbiB2My4NCg0K
PiA+ICsgICAgICAgaW50ZXJydXB0cyA9IDwwIDQ0IDQ+Ow0KPiA+ICt9DQo+ID4gLS0NCj4gPiAy
LjcuNA0KPiA+DQo=

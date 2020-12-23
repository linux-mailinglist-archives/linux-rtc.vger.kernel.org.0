Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25CD42E1943
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Dec 2020 08:09:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727396AbgLWHHG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 23 Dec 2020 02:07:06 -0500
Received: from mail-eopbgr50044.outbound.protection.outlook.com ([40.107.5.44]:12381
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727114AbgLWHHG (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 23 Dec 2020 02:07:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZYWJT6vgsA9plh7MjeW9wbgcDLwddqkebPaP39HGTqR3j1QhWl5z0GYzaIj5xJkNMkiPtWJ0c1RUHfgIJ35Xn46QH5XEBwPUVBpEJb67pm/2ZiJZRu+EVO8EJoG+dhmpXAdjrnGG5nn/dD1XMACtH9Dca0qdUQPeq8PHpfJZuPHBaeYEP7npwlCIMRJIDLWLixUEMmu6iZ/izWwcsZFOoJY0syYq7q58kh87WLJI5i2mXwgrVJqFszr3sqA0En4kiUbJm4cd4rjRQMiK6pXHM88qm/KJ1iLgw/LUWhwoHzxalOpC1SGD1MXyx80OrZb62jhbuiK/Ao5f6p1XWuv+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=312jKglCXRzjT/w4yxS2+Y43XsZSppqUoVrGB7xgdNc=;
 b=bSYHWoeUpJKHmV4DTaEmIAQy4l/QXh8b+ivhKU/4MPIIv0DAXs+1ro6BzlmHu2D+EU9TTt9SzbmbbC2sd/2NgA8AWYAkOBJXhsT1gUy2XCnxcn/vEi1mkg9FhzO+fSVCnpPKNlMkIpfkW8mbMBEXtSh+StwLrLcvb2jbALaug7+MJIhQxsU4eeMb/lqWF/DEqns48ZvaOGW446iiTmiYppDqgoDfK4x+6bhSCfMRl3ML+w0cYLVfZ9nXEsKxhh2shKlbIoWlGhquGxyUBeOKUorgdbgSOwF5xzjuzTuH9apCKXftsQcURJbquXilpOv4jJZ335YSsxMRG0nErV+kRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=312jKglCXRzjT/w4yxS2+Y43XsZSppqUoVrGB7xgdNc=;
 b=ZGlJo28IPqkRfbAOn9vrCcn/BfvZJcYKJEFwdC3PWKqNvhZ7iJiAu3HhQ72sQYkmq1L9N+gXzOTg6PmcyuNQ6170t7bzzCyQM6mStvdKfcQOTqA5tGC12jmMDRCwxNcnOX08+s3jnYbxZHFdX0J6QCv7AqXtsNvV4eQz0/Ue5uU=
Received: from DB6PR0401MB2438.eurprd04.prod.outlook.com (2603:10a6:4:33::14)
 by DB7PR04MB4265.eurprd04.prod.outlook.com (2603:10a6:5:1c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Wed, 23 Dec
 2020 07:06:16 +0000
Received: from DB6PR0401MB2438.eurprd04.prod.outlook.com
 ([fe80::f0c9:fd48:c8d1:5c22]) by DB6PR0401MB2438.eurprd04.prod.outlook.com
 ([fe80::f0c9:fd48:c8d1:5c22%11]) with mapi id 15.20.3676.034; Wed, 23 Dec
 2020 07:06:16 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     "Biwen Li (OSS)" <biwen.li@oss.nxp.com>,
        Leo Li <leoyang.li@nxp.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        Anson Huang <anson.huang@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jiafei Pan <jiafei.pan@nxp.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: RE: [v2 1/2] rtc: pcf2127: properly set flag WD_CD for rtc
 chips(pcf2129, pca2129)
Thread-Topic: [v2 1/2] rtc: pcf2127: properly set flag WD_CD for rtc
 chips(pcf2129, pca2129)
Thread-Index: AQHWyFi3vfea2qRqr0Od0O+duA/uu6oEY1xA
Date:   Wed, 23 Dec 2020 07:06:15 +0000
Message-ID: <DB6PR0401MB2438371950CE6663FA1499F78FDE0@DB6PR0401MB2438.eurprd04.prod.outlook.com>
References: <20201202031840.15582-1-biwen.li@oss.nxp.com>
In-Reply-To: <20201202031840.15582-1-biwen.li@oss.nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oss.nxp.com; dkim=none (message not signed)
 header.d=none;oss.nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5bb074bf-1af6-4b1b-7de2-08d8a7113d8f
x-ms-traffictypediagnostic: DB7PR04MB4265:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB4265176326E4B7B18FF002468FDE0@DB7PR04MB4265.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S2y0w3m8zUrf4bIk1gB8ZTr0ZMUY5CxIxT7yvYLwqmZYwxGIOpnM/BUuS3naGESwRLa3/zDmy5DcPU2a8BqvjwjNN2ujZZv4d6DAkHTDTd47+83HwKA34nUTspf4ny/NsulILQNdUM9NI4H74SE/3nqvH60WWr/wRRWqYpNph662Lx3ciUygoOFAl22ANWpFDV5p5GkkfXKTIPppeLYzoj7wRp1mxSnqbIRBP8/+jkNVhzgEyTLuT6AVYPOHJKb8siB48jKFGCJsRrX3vpMqZW1R+WFz0dvnHzR+I+PS/BnWkPK8fvc6ARO5mhV9OOxlHJkQ5lbDSp6MNB8hdseZVntEZ+frxrdgKlpoWB5ZlK8VcnFiqP45tgoUkEFtNKMCyvwZA5FgMqorRljtLAA7Hg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0401MB2438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(86362001)(52536014)(8676002)(66446008)(9686003)(76116006)(26005)(316002)(4326008)(33656002)(186003)(54906003)(64756008)(2906002)(6636002)(478600001)(5660300002)(71200400001)(66946007)(7696005)(83380400001)(6506007)(66556008)(53546011)(8936002)(44832011)(55016002)(110136005)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?gb2312?B?dTdpK0liS2JGV2x2MEh4VmtvNWtBNGpvcUE5alRJVlpVUHZMa2FTT3NTdnVT?=
 =?gb2312?B?SjFSY2JzL0VGSFFDSVd3UVA1djdzRFdpa2NmbzZtcU43cFFtb25GSng0dlpu?=
 =?gb2312?B?ZUVSWlVwS05LYlJVUEtjamo3VGN0V2ZtL2IrbzEwWXJCcUNWQm9MRWVNNEo0?=
 =?gb2312?B?Y3VMOXZTekVNNkJjaC92RzRkeHA0QXIwbEkzYmtBVXZPbWdRSDgxdGVsc2ZM?=
 =?gb2312?B?OTVOVWRRQURURDlDQ2xoZXZtcDM1azVicjhpVlBWU256WnRSeXNrWWNGOGxE?=
 =?gb2312?B?TDk3eGhTUjVkRWY2ZUM5QVdTK2hhcmlkeDVjWEFEUTZmZXpoVW1WM3FCNi91?=
 =?gb2312?B?eXJEWUdibmlwYXNXQndWalRJZGtWbUNFV0gyL2p1MGZFamlPMVhndWlNRG4v?=
 =?gb2312?B?WnFMQkpEYjRES3lZdzNOalErMVJpMmlQSHJmQ002dDBJTytLRnhHcU5iNUtN?=
 =?gb2312?B?cHNGZ2JQYlZLcURhOWZKaityZVNUOGt1RTlOTXU5Ym5NbTRLK2xMSTYrTXZs?=
 =?gb2312?B?S3RZZ0dqQ3NmL09FTkppbXJTZ2ZaSjBBNXdTODc3RklMMUpIRkpneldYeDE4?=
 =?gb2312?B?R0Z0Q3l1L0xILzg1ZlQ0bFFkUHlNcFhNSlR6Z3BoSWRwUHo1T1JaQ05ZSFRJ?=
 =?gb2312?B?eEIvUGZEZUxWSXVoVjdrSGR5Y2QwWTN6bXYzSEdKZ1hydExUZklUSU9zS3RJ?=
 =?gb2312?B?VG5mYzFmK1JPYWRTRG5paGpMWWdmZzJuK0s4SlZCdWdUMno0TE9PWUY5QTFl?=
 =?gb2312?B?RzU2OWt5R1VPRmovSWcwaHhBWVpaRGN3M1d4Tk9hVGQ1enhXMVhiSkZVT0NX?=
 =?gb2312?B?emZHUnIvQ3ZBZ0w2MTNOaDFjbi96ZTU3UW53dGJuNTU0ODRMY3g3cUorRU9z?=
 =?gb2312?B?UERTeGNOMlR6K3BYOGhhTUtlVTlrMGszRUJ0SXVFeERiaFZBWUQ2b1dkeWVk?=
 =?gb2312?B?eWJXR28rTWp1ZldYT2VvNXl4ckROS2lTNnRtaXFZUWVSbXoxSTAvb0dKaWVN?=
 =?gb2312?B?Qm03dyt1VmtaM20rckZ4bGxBZGkvbTdiUXJyL1BTZ05iSGFCNXdXMlJkQXhX?=
 =?gb2312?B?RTh1cFBsUHFYb2JjREpZQWZiL0N0SEQ2bElHVU93QU5zbWg5c0FGS1FyUmhq?=
 =?gb2312?B?VlFXb3Zoa1pCWHBtN2EycjN0SnBZTGJsZ2pmSHZ0LzFUTWx3TjdWVnE2Nk9T?=
 =?gb2312?B?VUY5dms5YkRDc1hkSWZ2bHh3SkQyaVZ5QU5rRU5SL0pyS25TWTFmUTRCN3Nx?=
 =?gb2312?B?WlRNT3RSays4ajVYMXBCZ0xsdGtDQzErNUMwZWwxY21WaW1mVFNZQlZIMmRR?=
 =?gb2312?Q?5nMuF6xc1Qk5s=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0401MB2438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb074bf-1af6-4b1b-7de2-08d8a7113d8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2020 07:06:15.8113
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kt2d5SkueLcJ/iotZ562Vu8Af4dNT1qtCH86ahm99zkCOCP6BUAMVSgNqWqUIBsAImaYWoTrMbxoVwDQ90btDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4265
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGkgQWxleGFuZHJlLA0KDQpBbnkgY29tbWVudHM/DQoNClJlZ2FyZHMsDQpCaXdlbiBMaQ0KPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCaXdlbiBMaSA8Yml3ZW4ubGlAb3Nz
Lm54cC5jb20+DQo+IFNlbnQ6IDIwMjDE6jEy1MIyyNUgMTE6MTkNCj4gVG86IExlbyBMaSA8bGVv
eWFuZy5saUBueHAuY29tPjsgYWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb207IEFuc29uDQo+
IEh1YW5nIDxhbnNvbi5odWFuZ0BueHAuY29tPjsgQWlzaGVuZyBEb25nIDxhaXNoZW5nLmRvbmdA
bnhwLmNvbT4NCj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEppYWZlaSBQYW4g
PGppYWZlaS5wYW5AbnhwLmNvbT47DQo+IGxpbnV4LXJ0Y0B2Z2VyLmtlcm5lbC5vcmc7IEJpd2Vu
IExpIDxiaXdlbi5saUBueHAuY29tPg0KPiBTdWJqZWN0OiBbdjIgMS8yXSBydGM6IHBjZjIxMjc6
IHByb3Blcmx5IHNldCBmbGFnIFdEX0NEIGZvciBydGMgY2hpcHMocGNmMjEyOSwNCj4gcGNhMjEy
OSkNCj4gDQo+IEZyb206IEJpd2VuIExpIDxiaXdlbi5saUBueHAuY29tPg0KPiANCj4gUHJvcGVy
bHkgc2V0IGZsYWcgV0RfQ0QgZm9yIHJ0YyBjaGlwcyhwY2YyMTI5LCBwY2EyMTI5KQ0KPiANCj4g
U2lnbmVkLW9mZi1ieTogQml3ZW4gTGkgPGJpd2VuLmxpQG54cC5jb20+DQo+IC0tLQ0KPiBDaGFu
Z2UgaW4gdjI6DQo+IAktIHNldCBmbGFnIFdEX0NEIGFjY29yZGluZyB0byBjb21wYXRpYmxlDQo+
IA0KPiAgZHJpdmVycy9ydGMvcnRjLXBjZjIxMjcuYyB8IDcgKysrKysrLQ0KPiAgMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvcnRjL3J0Yy1wY2YyMTI3LmMgYi9kcml2ZXJzL3J0Yy9ydGMtcGNmMjEyNy5jIGlu
ZGV4DQo+IDAzYzljYjZiMGI2ZS4uYTU0MThiNjU3YzUwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L3J0Yy9ydGMtcGNmMjEyNy5jDQo+ICsrKyBiL2RyaXZlcnMvcnRjL3J0Yy1wY2YyMTI3LmMNCj4g
QEAgLTYyMCw2ICs2MjAsMTAgQEAgc3RhdGljIGludCBwY2YyMTI3X3Byb2JlKHN0cnVjdCBkZXZp
Y2UgKmRldiwgc3RydWN0DQo+IHJlZ21hcCAqcmVnbWFwLA0KPiAgCSAqIFdhdGNoZG9nIHRpbWVy
IGVuYWJsZWQgYW5kIHJlc2V0IHBpbiAvUlNUIGFjdGl2YXRlZCB3aGVuIHRpbWVkIG91dC4NCj4g
IAkgKiBTZWxlY3QgMUh6IGNsb2NrIHNvdXJjZSBmb3Igd2F0Y2hkb2cgdGltZXIuDQo+ICAJICog
Tm90ZTogQ291bnRkb3duIHRpbWVyIGRpc2FibGVkIGFuZCBub3QgYXZhaWxhYmxlLg0KPiArCSAq
IEZvciBwY2EyMTI5LCBwY2YyMTI5LCBvbmx5IGJpdFs3XSBpcyBmb3IgU3ltYm9sIFdEX0NEDQo+
ICsJICogb2YgcmVnaXN0ZXIgd2F0Y2hkZ190aW1fY3RsLiBUaGUgYml0WzZdIGlzIGxhYmVsZWQN
Cj4gKwkgKiBhcyBULiBCaXRzIGxhYmVsZWQgYXMgVCBtdXN0IGFsd2F5cyBiZSB3cml0dGVuIHdp
dGgNCj4gKwkgKiBsb2dpYyAwLg0KPiAgCSAqLw0KPiAgCXJldCA9IHJlZ21hcF91cGRhdGVfYml0
cyhwY2YyMTI3LT5yZWdtYXAsIFBDRjIxMjdfUkVHX1dEX0NUTCwNCj4gIAkJCQkgUENGMjEyN19C
SVRfV0RfQ1RMX0NEMSB8DQo+IEBAIC02MjcsNyArNjMxLDggQEAgc3RhdGljIGludCBwY2YyMTI3
X3Byb2JlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0DQo+IHJlZ21hcCAqcmVnbWFwLA0KPiAg
CQkJCSBQQ0YyMTI3X0JJVF9XRF9DVExfVEYxIHwNCj4gIAkJCQkgUENGMjEyN19CSVRfV0RfQ1RM
X1RGMCwNCj4gIAkJCQkgUENGMjEyN19CSVRfV0RfQ1RMX0NEMSB8DQo+IC0JCQkJIFBDRjIxMjdf
QklUX1dEX0NUTF9DRDAgfA0KPiArCQkJCSAoZGV2aWNlX3Byb3BlcnR5X21hdGNoX3N0cmluZyhk
ZXYsICJjb21wYXRpYmxlIiwNCj4gIm54cCxwY2YyMTI3IikNCj4gKwkJCQkgID8gKFBDRjIxMjdf
QklUX1dEX0NUTF9DRDApIDogKDApKSB8DQo+ICAJCQkJIFBDRjIxMjdfQklUX1dEX0NUTF9URjEp
Ow0KPiAgCWlmIChyZXQpIHsNCj4gIAkJZGV2X2VycihkZXYsICIlczogd2F0Y2hkb2cgY29uZmln
ICh3ZF9jdGwpIGZhaWxlZFxuIiwgX19mdW5jX18pOw0KPiAtLQ0KPiAyLjE3LjENCg0K

Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC0F709CCA
	for <lists+linux-rtc@lfdr.de>; Fri, 19 May 2023 18:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbjESQsn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 19 May 2023 12:48:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbjESQsl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 19 May 2023 12:48:41 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2139.outbound.protection.outlook.com [40.107.114.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED95B10EC;
        Fri, 19 May 2023 09:48:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MqmYV4HrSSctoQkW1yApRJlBeZDyJsVA9+l0JYYZ+8+IybCw3MwzSvMYdKi5LKxDVgCs32LpUDi8Uuw6Arl/k1z0KyCdhJpXNhsrMHVux6vTJ9m/NiZm4P/L7ZrN1nvkowFx35aXpGELsRN8B47Gsg9MxXuVwp+fQSfDb+MkoUisR0MeSvlyn4cmUULO/Fh+vXg/Y3XvI/yJV3Z0wSFmkpbknV0g6Bg62N8fmbn8BaOxIAFfq/g5EybI9njO77uNULfkMti7R4fW5R7ASCPkmuP+P8o6xNXlczYsipHqKTEHdJ9Toy9KRZkGco9Ch/WvYRrpnGUyAXvB8kyHf206Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEM8AfdahMbravm10kpsTJh00nYCE95XpX0zYv1FkHc=;
 b=E6xPTClF39cjkNjZr/gZOrrrP+p4F6CeR0QWpksQh1tEE+0646X7tcAVpDW4FHm+nI1jiAWtu9Cfug11Oh2nQ9YIHF1/+f4WK280ln+gA4IEpQNuKvKLav5mb0RVOd4JuYmV+wqEYO7U089y0vV9B/9jYiSIzXF2vEjqkp9XfuAOJssVMkQOFp1p2fmXbEhuCHWUzkobVI7u19BtofcSsFnIEeMdISpwtyPh7AIH9MJL9Ym5oNQx/I/yzjhHfmtTvo+PTt6tkWBXOSqm8oZnXLXEVE9AMFMHHpf0fT2tmuXyd0awsCu0Hsk0Tlp9+QZmwtKtAAFjRCuHsCMnkRJF7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEM8AfdahMbravm10kpsTJh00nYCE95XpX0zYv1FkHc=;
 b=HUEBfaL2gmanmsNYowqeZK6KU75buckGfH14QXP5qyT1vS83DkE2HibeX375174Zn2AP1rUUf6Ei7nGq9Ext14VjBfhnR+GFQ6UHcReuMKRDPhqz7Lh9PYilTWn3daSAk/uUSDA8quLBb/I+1yrmxeEShbPOdpAPRYCEvDfVu+E=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB5895.jpnprd01.prod.outlook.com (2603:1096:604:c7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Fri, 19 May
 2023 16:47:47 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 16:47:46 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 08/11] rtc: isl1208: Add support for the built-in RTC
 on the PMIC RAA215300
Thread-Topic: [PATCH v4 08/11] rtc: isl1208: Add support for the built-in RTC
 on the PMIC RAA215300
Thread-Index: AQHZiX0ctt/oL/9pKUGgOP1rdiUG3K9hjxEAgAA+vZA=
Date:   Fri, 19 May 2023 16:47:46 +0000
Message-ID: <OS0PR01MB5922E23E0BAFA4E50D1C2227867C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230518113643.420806-1-biju.das.jz@bp.renesas.com>
 <20230518113643.420806-9-biju.das.jz@bp.renesas.com>
 <CAMuHMdVNJbiao8Xsk5dQXMH9qtnZyRPaYOSEttwmmkuHqYV6=A@mail.gmail.com>
In-Reply-To: <CAMuHMdVNJbiao8Xsk5dQXMH9qtnZyRPaYOSEttwmmkuHqYV6=A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB5895:EE_
x-ms-office365-filtering-correlation-id: dcf67ee2-341e-4e9d-9bfe-08db5888c65b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /gd/w50K7gJq/kzU5t9aZM27xVble7n+eVOWhDY3sTte9fxd3b8ek0Zd4/Q3xQl7Yce0NCSnu+0abulMWS5HodkfPN68X8fQn+Dfudk9ALAW/DQ868xgI9yXSdh/AKvRvnPRHj+hR91BG+grbPrlEU4odTCGYWJwnWcA/kVnyQMZ6Y1woscuL9JG7mIy70LYkC0rO94WB6BZxdJo9UU0DQMbooe+CGOH6SQNln+L58cyX/gNvB08fHdSYi9gXQqZN9zQMbJetam8WsbWPrZJoFBdr/xVXDMfbFcfVLAWlV0Klm0Xbk7BRVZsrfkF2e9izrV0llLRoXxoSyio7JN2ZREOQ0I+0QkoetfYD+HDfxO6Y0h23Ul+KUesFZ5bKN0P2SxmbC2/pByvYlYUNxV7xQBtqpAbFI9KiPfoZpWgwDBKtOsopFSBBnkgepvc6cTZYhcedZ8FGN3/p4FDWbf+A4VHEi5GridOSVzRJF1oefnPNkPlEbTIjXVi2CjgFeg2jpOZVqpje7mol3FgoZvATbOa9NU0BS1t3UNeiTPaWQ5YqMS38cOGTj2BRgaX+oRzipBYW6UvnBLtFDxKMvLaNviTY5KVbE2a6L9OOIq8sNy/8D8l4X0qmTeWFE1tJOp9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(451199021)(4326008)(66446008)(478600001)(66946007)(64756008)(66476007)(76116006)(66556008)(6916009)(54906003)(316002)(33656002)(38070700005)(86362001)(83380400001)(26005)(6506007)(53546011)(9686003)(186003)(7696005)(71200400001)(5660300002)(8676002)(52536014)(55016003)(2906002)(8936002)(41300700001)(122000001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1VOYWR4eVFkWlQyajVLRE5iYVFoVUhlSU5LNDkrMjNHUll2aUpsV1JOWUVy?=
 =?utf-8?B?Ull1TmFUalQ1TTBUaUg1RkVjd2U0R2JjQnd2Y1NaK1V5MWd2QytWV2JnK3JW?=
 =?utf-8?B?c0d4SFU4ZldHdXN3VnovVUQ5SUV6WHpmR2FvNmJPdnNDall2V3VyQW81THg5?=
 =?utf-8?B?UDNKMnBSM21TUW0zcE1VMktFb3VkL2lBdU90T1NDYUExYlhsNHIveUNmVWhj?=
 =?utf-8?B?bnBWOUJmdnNvZmxVcmMxOVVpeWNoVVl5VEFBd29BQzIrb1Btb0ZUaVlGNzM0?=
 =?utf-8?B?SHN0TjN0QUdxZllGUVZMMUdGQ2RVaFhGc3N4MzJEdXhlVU5qZWJRdlAySlI4?=
 =?utf-8?B?dUFWSTVKSkFJTnlLSVlDSU1QdXJSUzFpWVpCNSsrUWxGTXpDRGltWEcvL3BU?=
 =?utf-8?B?Z096TE5RMUlQeHNpQUU1L3poMFJWWWhIQ1k3S1lOK0h3RnNkSCtlQlRTQnRZ?=
 =?utf-8?B?Q2UrSU94K0U3eE9aRVM3NHh0eUo1aUR5Mm4rc0phd3k2bmc1d1BGM29jbCtl?=
 =?utf-8?B?ODljWC9HSkQwZ05YK0RVRURvM2k3QUZaOXZZU3UrbUV2MnpaYXFZRWZkTitS?=
 =?utf-8?B?ZGUwTkRUdTNkUFJqV2dVczdxSHFLSVh5aFNMVGRleHVmdTkyTEZ6VmMyandn?=
 =?utf-8?B?blUxQmxxdVR4cXpQaUwyWjFPNGt4aDhJbGVpOVo0YTNNOFdiZ0pORGRua3JW?=
 =?utf-8?B?UmFwWUZ1N2gxdFpjOU1Lai80TU1rcVNFZXJuVWJVNmt4VWYxOGxPdks5MFRS?=
 =?utf-8?B?WlFzRmcwcy9CU3M0Nk40dFlEQUI1Wmt0Q2JIdW93U2ZsZWFSemxSRUtRbXp2?=
 =?utf-8?B?WEtSQk5sVmo2ZWRVeW5mbEpPSzBHZnlUb0tZUzZsZEJtc3dkT1RjNDJQUTZl?=
 =?utf-8?B?azVmc0wwcnhFaEdESE82bzBaTmthMER4aWVtTkVQQTNZZ0luTFlpbmdvR2ZR?=
 =?utf-8?B?OWUreEdKbVNlK0hLTUloTm5kc2VKOWt5NEl4bW1PNVpVbHJ5dVJJbGF5bHlJ?=
 =?utf-8?B?NUxqdGFxekhFK0lLM080L2NwSmdidXRaRHB6bGZuWFlkU25kcllBWUZNU2VP?=
 =?utf-8?B?b0RyTHdLa3ZXdHE3WHQvSERoQS9KTDM5SnpRU3E3aW42UnZ6UUJIaGVCem9W?=
 =?utf-8?B?QkliRHo0Zk1BTFJyanJnRXQzaFNkYXNmYUhkNFlBb3lXeStDL095YTNPOHhG?=
 =?utf-8?B?bm5NaEYrczNYSWRzWHZBWk1DUXF0SGdhaVpkNGNNN0NwZUc3RFRQSkpVM0FC?=
 =?utf-8?B?TzlJQ0ZQR3FUMUNpU2RtTUlIRG8wczZXUUlLZllicisxbnR2UmEyMisxZVIr?=
 =?utf-8?B?dlJ0UUNXYW01aFVaZm8yZndRclJWVTFZMU9lSE1kR1dEekNFVnplRkFRa2tG?=
 =?utf-8?B?dm9qVHFvamwrLzMvRmU4QlovZEg1NlQ4UEhoM1hCM1g0MCtJVUFEQ0RjVTBN?=
 =?utf-8?B?bEVnc1N3TzF6TDVLMUlNQ0o2VzF3MGZHSHE4WWNadFVzd0RBVFFhYjRMTHBq?=
 =?utf-8?B?WXNpV2RFeEd6Y1BwTUJYdkxTWW0zbjY0NmJPMjVWdm16aU1FckVRZThDdWlK?=
 =?utf-8?B?SkR5eTF0S3JHQm9peTh4YWh6ckZEeS9OZEliZm1kL1gxK3hvVmhWdzNlVkFB?=
 =?utf-8?B?SWZCd0NFbHRQZXpsdElWTzYzdHVnL2lUb3RKTzV6aGV4aTVEeDRrejBYbHhi?=
 =?utf-8?B?dXhiY0Zkb3VlVUZJRk9INE5wNERxVHZmczhrMlQ3UC9vU2poOHBTbUNjYlhQ?=
 =?utf-8?B?cU9SSnVnQkk3ZVFrWWw0K254NVNhTkRBbVN6bnZ5czIvUXB0N1hMMEVTRDJB?=
 =?utf-8?B?Q0k4VWlMVVRiMHdtMHdWUzJUellBNEh1elF5ejBYejZzS0xYaFZmR0pycWl6?=
 =?utf-8?B?dUUxS3BHWjNia2lrVFRGVE5KYTU5QVprckJFc2FESXlwcW5KZG01SG45bkRY?=
 =?utf-8?B?MUsxV0QrMXQrQXkzL3haTWlmN0Uwc2tBdkkwRnFRSzJPTUhNZ2tnaHRqOXR2?=
 =?utf-8?B?aFBhbG1lZlFNRVFpdjhTcktOZE9kdTZLNUtuUW1kQ3VvU1ZMVFVyZGZxK3cy?=
 =?utf-8?B?QlRxSy9QdjNsQ25oL0pTZndNZldORHhHeFNwMnkyZS95SlVOa1lHUHd0K2VR?=
 =?utf-8?Q?afhvvro7uPmnOCzQI7Sn01wya?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf67ee2-341e-4e9d-9bfe-08db5888c65b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2023 16:47:46.9600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /3gLjAp/myUU4DnSxOQVUM15e0n9PKQ5tPu95vH09zvx+Fxynx84/nmQUAneVlqRcrZk7EerBDpwfZIObsxPsz10JJl4DyUk/dbwSpc85HA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5895
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgTWF5IDE5LCAyMDIzIDE6NTQgUE0NCj4gVG86IEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gQ2M6IEFsZXNzYW5kcm8gWnVtbW8g
PGEuenVtbW9AdG93ZXJ0ZWNoLml0PjsgQWxleGFuZHJlIEJlbGxvbmkNCj4gPGFsZXhhbmRyZS5i
ZWxsb25pQGJvb3RsaW4uY29tPjsgbGludXgtcnRjQHZnZXIua2VybmVsLm9yZzsgRmFicml6aW8N
Cj4gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+OyBsaW51eC1yZW5lc2Fz
LQ0KPiBzb2NAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMDgvMTFd
IHJ0YzogaXNsMTIwODogQWRkIHN1cHBvcnQgZm9yIHRoZSBidWlsdC1pbg0KPiBSVEMgb24gdGhl
IFBNSUMgUkFBMjE1MzAwDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVGh1LCBNYXkgMTgsIDIw
MjMgYXQgMTozN+KAr1BNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4g
d3JvdGU6DQo+ID4gVGhlIGJ1aWx0LWluIFJUQyBmb3VuZCBvbiBQTUlDIFJBQTIxNTMwMCBpcyB0
aGUgc2FtZSBhcyBJU0wxMjA4Lg0KPiA+IEhvd2V2ZXIsIHRoZSBleHRlcm5hbCBvc2NpbGxhdG9y
IGJpdCBpcyBpbnZlcnRlZCBvbiBQTUlDIHZlcnNpb24gMHgxMS4NCj4gPiBUaGUgUE1JQyBkcml2
ZXIgZGV0ZWN0cyBQTUlDIHZlcnNpb24gYW5kIGluc3RhbnRpYXRlIGFwcHJvcHJpYXRlDQo+IA0K
PiBpbnN0YW50aWF0ZXMgdGhlDQpPSy4NCj4gDQo+ID4gUlRDIGRldmljZSBiYXNlZCBvbiBpMmNf
ZGV2aWNlX2lkLg0KPiA+DQo+ID4gRW5oYW5jZSBpc2wxMjA4X3NldF94dG9zY2IoKSB0byBoYW5k
bGUgaW52ZXJ0ZWQgYml0IGFuZCBpbnRlcm5hbA0KPiA+IG9zY2lsbGF0b3IgaXMgZW5hYmxlZCBv
ciBub3QgaXMgZGV0ZXJtaW5lZCBieSB0aGUgcGFyZW50IGNsb2NrIG5hbWUuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4g
LS0tDQo+ID4gdjMtPnY0Og0KPiA+ICAqIEFkZGVkIHN1cHBvcnQgZm9yIGludGVybmFsIG9zY2ls
bGF0b3IgZW5hYmxlL2Rpc2FibGUuDQo+IA0KPiBUaGFua3MgZm9yIHRoZSB1cGRhdGUhDQo+IA0K
PiA+IC0tLSBhL2RyaXZlcnMvcnRjL3J0Yy1pc2wxMjA4LmMNCj4gPiArKysgYi9kcml2ZXJzL3J0
Yy9ydGMtaXNsMTIwOC5jDQo+IA0KPiA+IEBAIC04NTIsMTEgKzg2NSwyNSBAQCBpc2wxMjA4X3By
b2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpDQo+ID4gICAgICAgICAgICAgICAgIGlzbDEy
MDgtPmNvbmZpZyA9IChzdHJ1Y3QgaXNsMTIwOF9jb25maWcgKilpZC0NCj4gPmRyaXZlcl9kYXRh
Ow0KPiA+ICAgICAgICAgfQ0KPiA+DQo+ID4gLSAgICAgICB4aW4gPSBkZXZtX2Nsa19nZXQoJmNs
aWVudC0+ZGV2LCAieGluIik7DQo+ID4gLSAgICAgICBpZiAoSVNfRVJSKHhpbikpIHsNCj4gPiAt
ICAgICAgICAgICAgICAgY2xraW4gPSBkZXZtX2Nsa19nZXQoJmNsaWVudC0+ZGV2LCAiY2xraW4i
KTsNCj4gPiAtICAgICAgICAgICAgICAgaWYgKCFJU19FUlIoY2xraW4pKQ0KPiA+ICsgICAgICAg
aWYgKGNsaWVudC0+ZGV2LnBhcmVudC0+dHlwZSA9PSAmaTJjX2NsaWVudF90eXBlKSB7DQo+ID4g
KyAgICAgICAgICAgICAgIHhpbiA9IG9mX2Nsa19nZXRfYnlfbmFtZShjbGllbnQtPmRldi5wYXJl
bnQtPm9mX25vZGUsDQo+ICJ4aW4iKTsNCj4gPiArICAgICAgICAgICAgICAgaWYgKElTX0VSUih4
aW4pKSB7DQo+IA0KPiAtRU5PRU5UIG1lYW5zIGNsb2NrIG5vdCBwcmVzZW50LCBzbyBjb250aW51
ZSBiZWxvdy4NCj4gQW55IG90aGVyIGVycm9yIGNvZGVzIGFyZSB0byBiZSBwcm9wYWdhdGVkIHVw
c3RyZWFtLg0KDQpBZ3JlZWQuDQoNCj4gDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xr
aW4gPSBvZl9jbGtfZ2V0X2J5X25hbWUoY2xpZW50LT5kZXYucGFyZW50LQ0KPiA+b2Zfbm9kZSwg
ImNsa2luIik7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKElTX0VSUihjbGtpbikp
DQo+IA0KPiBMaWtld2lzZS4NCj4gDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gLUVOT0RFVjsNCj4gDQo+IENsb2NrIG5vdCBwcmVzZW50IGlzIG5vdCBhbiBlcnJv
ciwgYXMgdGhlIGNsb2NrIGlzIG9wdGlvbmFsIGZvciBEVA0KPiBiYWNrd2FyZHMgY29tcGF0aWJp
bGl0eS4NCg0KT0suDQoNCj4gDQo+ID4gKw0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGlu
dF9vc2NfZW4gPSBmYWxzZTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBjbGtfcHV0KGNs
a2luKTsNCj4gPiArICAgICAgICAgICAgICAgfSBlbHNlIHsNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICBjbGtfcHV0KHhpbik7DQo+ID4gKyAgICAgICAgICAgICAgIH0NCj4gPiArICAgICAg
IH0gZWxzZSB7DQo+ID4gKyAgICAgICAgICAgICAgIHhpbiA9IGRldm1fY2xrX2dldCgmY2xpZW50
LT5kZXYsICJ4aW4iKTsNCj4gPiArICAgICAgICAgICAgICAgaWYgKElTX0VSUih4aW4pKSB7DQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xraW4gPSBkZXZtX2Nsa19nZXQoJmNsaWVudC0+
ZGV2LCAiY2xraW4iKTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoIUlTX0VSUihj
bGtpbikpDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnRfb3NjX2VuID0g
ZmFsc2U7DQo+ID4gKyAgICAgICAgICAgICAgIH0NCj4gPiAgICAgICAgIH0NCj4gPg0KPiA+ICAg
ICAgICAgaXNsMTIwOC0+cnRjID0gZGV2bV9ydGNfYWxsb2NhdGVfZGV2aWNlKCZjbGllbnQtPmRl
dik7DQo+ID4gQEAgLTg3Niw3ICs5MDMsOCBAQCBpc2wxMjA4X3Byb2JlKHN0cnVjdCBpMmNfY2xp
ZW50ICpjbGllbnQpDQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiBzcjsNCj4gPiAgICAgICAg
IH0NCj4gPg0KPiA+IC0gICAgICAgcmMgPSBpc2wxMjA4X3NldF94dG9zY2IoY2xpZW50LCBzciwg
aW50X29zY19lbik7DQo+ID4gKyAgICAgICByYyA9IGlzbDEyMDhfc2V0X3h0b3NjYihjbGllbnQs
IHNyLCBpbnRfb3NjX2VuLA0KPiA+ICsNCj4gPiArIGlzbDEyMDgtPmNvbmZpZy0+aGFzX2ludmVy
dGVkX29zY19iaXQpOw0KPiANCj4gTm8gbmVlZCB0byBjaGFuZ2UgaXNsMTIwOF9zZXRfeHRvc2Ni
KCkgKGJ1dCBwZXJoYXBzIHJlbmFtZSB0aGUNCj4gaW50X29zY19lbiBwYXJhbWV0ZXI/KSBpZiB5
b3Ugd291bGQgcGFzcyAiaW50X29zY19lbiBeIGlzbDEyMDgtPmNvbmZpZy0NCj4gPmhhc19pbnZl
cnRlZF9vc2NfYml0Ii4NCj4gKGJld2FyZTogQyBoYXMgbm8gbG9naWNhbCBeXiwgb25seSBiaXR3
aXNlIF4pLg0KDQpPSyB3aWxsIHVzZSAidTggeHRvc2JfdmFsIiBhcyB0aGUgcGFyYW1ldGVyLg0K
DQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+IA0KPiA+ICAgICAgICAgaWYgKHJjKQ0KPiA+ICAgICAg
ICAgICAgICAgICByZXR1cm4gcmM7DQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2
ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0K
PiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNh
bCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuDQo+IEJ1dCB3aGVuIEknbSB0YWxraW5n
IHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZw0KPiBs
aWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9y
dmFsZHMNCg==

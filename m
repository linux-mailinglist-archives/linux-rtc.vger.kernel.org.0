Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAB356F5547
	for <lists+linux-rtc@lfdr.de>; Wed,  3 May 2023 11:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbjECJvQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 3 May 2023 05:51:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbjECJuk (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 3 May 2023 05:50:40 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2098.outbound.protection.outlook.com [40.107.113.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F156F5FF4;
        Wed,  3 May 2023 02:50:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTjIHLTkKoVvQNAA+tYep/sz9rumU8FMkvpUwEvOeD5TyZFac95D9CwKSpZEKSdiHNnKNJvQj4FsmXtHxZJ/v0ieReUao9LglHk+sUQgMuWLt/DyTNIfxPJLNe5In0bCve5dAbpS+oS0bSRx2ThcTFDlqr38aFqgU2E0MSphoKZrCxDgRNbthZMvd5mNzAASeUcRrZQuUBeXxCtJi7lKLU30jsIAFpaGqVwDSyptAmcR5rQeQKPt/cS1H7rfQZyvaGP2uZTDcmF7qr5NmTHZuBcUUplULvtaeXOtQ2kKgCBFqDZOAvIja43lsTBdKMLuwo9wZ0B7KTPDYhUMED8WXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nrf5OptsDI60XASDnKEfiM2XfLgm5BiwqcJ/6dsoKEU=;
 b=cYudFNMYn5OKEIb1F0vh+zXBHyvngNTxnGWhsSwdItNewWKLnhHuSxZcFOZ+udSVDZcFpq/Xp6pVYu+ozxq0+ZsVKApE1/9YnFGmxyRGrD8rKcuU8BsXYeipOTY6zNAv7ZxISSAvvTm9bEAxPjfRHmKOAoeySk4Fcu6a93cJZvAcoO+u6VqeGZPKHDcAZO7PfnuB2Oo3W6NT6gMJcPuGieWWQHYoVd5oVx4JHBHStio52HEgcrySziiQjfE3FTJ3C8U6G1mgsPlismMmtBzu3AQWfP7ppyNX04FKU5H+DTsuD13piqQdPrHdV5QQ+pOgAWYMJYMIDT1xCfiCnXAlHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nrf5OptsDI60XASDnKEfiM2XfLgm5BiwqcJ/6dsoKEU=;
 b=FWOn5wmgDab85edOdotWjhgkrjQa1y50g6739ca/95qxP01kOgqkOg/EkS75ko4uUqHcl2yi0q/JaCOex+VypG4KMU4qrzElhhhEAXHtKMlFFQuJ7ycnjzc2naS18+O0xGwg3Rfa+FC3aRqmwdBPMqEpC1kUltU0TL52JqLGTqI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB11022.jpnprd01.prod.outlook.com (2603:1096:400:3b6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Wed, 3 May
 2023 09:49:57 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6363.021; Wed, 3 May 2023
 09:49:56 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Trent Piepho <tpiepho@gmail.com>
Subject: RE: [PATCH RFC 3/6] dt-bindings: rtc: isl1208: Convert to json-schema
Thread-Topic: [PATCH RFC 3/6] dt-bindings: rtc: isl1208: Convert to
 json-schema
Thread-Index: AQHZfZvAkKrBUOZKYEaRmzaYqKPbDK9IRzUAgAAFGQA=
Date:   Wed, 3 May 2023 09:49:56 +0000
Message-ID: <OS0PR01MB5922ACD74D06F603B8F9700D866C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230503084608.14008-1-biju.das.jz@bp.renesas.com>
 <20230503084608.14008-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdUbH5CbYO14G1aVNVhBc10+tzSYGuLoEof7tuqAHpnz=A@mail.gmail.com>
In-Reply-To: <CAMuHMdUbH5CbYO14G1aVNVhBc10+tzSYGuLoEof7tuqAHpnz=A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB11022:EE_
x-ms-office365-filtering-correlation-id: 7a28fbf2-a2f1-48bd-2e37-08db4bbbc0cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s1jN7vfIXOW+Ac8ffVTSIMyCgyrOwhAuCenO2w/0rZvjg2l8ucHDyED2zraFYe/Lwjymamlv8bvodUPaf64/McmCUscj1s00ACLL3mMIJAK7sXRBem1Qn7YXSG0en5I9IK5d7DfJqRRnvUxnIBF4DW1064PvgW6fqzreMlLDvS3Lsydcne1zhtUnNiIS2qyD6ZSNUIX6hswyojy17UCPT7+UPbRAlz3dLq461r2ztLhL75qdCm/Pajp0h108i4i0FpdXHTWKJaPoPS/nU86D+9ffGYj19ZvbJFMpAMgFDvi5sHUuf2xfU+jOgmQsLy1Q88wReDpYn1qyIoXd2LrAfX/M65RnF82cd2DYZK9bb2H8joZXnvTUquHV40Ocy8Vq6hD1qrXtpIWoLh9XrN22jCv0QcndBH+rAACRN9U91NcK6g9/YJg7XWR4dbBAocNbpq4PPwrZr1MzPOiyE6WhLqdFKvRi1gMckNGW2jHKRxquW7RAU1SBb0YluKQxK2GYFvHapIe4CTFW2BahavgtXUW7fLn3A68Uo5EOwoCb6IKOiTXYVGobF22bwr5kJJWP/wcW47WLXeNRtsVPFnAKTvyKVi5F5611BgJIsYdUEepXWFm8xnPxya3ACkUMgrss
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(451199021)(4326008)(54906003)(316002)(7416002)(41300700001)(45080400002)(478600001)(52536014)(5660300002)(8936002)(76116006)(2906002)(8676002)(6916009)(66476007)(66556008)(66946007)(64756008)(66446008)(7696005)(71200400001)(83380400001)(53546011)(6506007)(26005)(9686003)(55016003)(186003)(86362001)(38070700005)(33656002)(122000001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWpkTFRya0p1RVRpUHFpQXhZb2JJWHlMdENjTyt1UVFwZmZYakI5VkFvZmp0?=
 =?utf-8?B?a1EvTzBYaUpsSGZVbmp3QUExMW44dlkzK3owLy9ORUxZU1h5SzJkZDhMZ3RX?=
 =?utf-8?B?TUxld1BnME1HMmVHQkdPaTM1RVp6STl0bzRqZ1J0NjFhaTNjeDQ1aHRNTzlB?=
 =?utf-8?B?a3YzZmUyYmxGbXNBekx2VVpFbzRBUTZURWQ1eHNoUVNRakNjcDhhNHlZYkFm?=
 =?utf-8?B?OGQrQnZGazlNbkJFOFBHTE9KeW5FVFdoN0tsWW5US3lCL21hd0dOUjRjUUkz?=
 =?utf-8?B?bEQ5SmFQbkx1eTgrRFFiUXZXazMwUVpCRWNic1hMQktiUXZXVVdpc0czN3Vy?=
 =?utf-8?B?WVFqeno2SmtEa0RKdUhQWTU5YytwbjFXamxkYVlibzlRWHpSdmdzQWNSN29Z?=
 =?utf-8?B?M3VYakt1bUdmMU11dzhnano2bGloMjFsTlhLQVJlUTRQT0lYVFFSN25BczJm?=
 =?utf-8?B?eTNLV3RNaXhxQUc0TWx5OVBKSkcxODVxbVBwV2VIVGs2YjRDMU5ZcWRBa2dT?=
 =?utf-8?B?Y2oxRURUYTcvaVFQaFRnVUJrYUJjdkxyL0t4cGd3eU4rVlVTcHBMT1MydmRW?=
 =?utf-8?B?dnM1dkNGSnd1QS9GSm5ROHhRQWhGK2piRnlEaUEyekVOZWQvdW80RjRFa1Zy?=
 =?utf-8?B?ckZkL3pJU1JPcmJjTnlidjFzYzBJelRSNmxnMEg4N2RRNExvcytJRFlDTEQw?=
 =?utf-8?B?VTJuL3BRQndnSlg4ZERGSmZQN2JCcEJWYngvaEtydTA3aWVxUURBRjBmT2h5?=
 =?utf-8?B?Vy9LdUd1cU50RTdMSUR0RStJNmZrZE5tYzJXZ2I3SGNhVWNHbEVtWGgyNWJx?=
 =?utf-8?B?SE1XNGtmSnAwckN6N2RVSWlncW5CSnVIeFh6dlFhbFp1T05yajNKZUFDY0Vt?=
 =?utf-8?B?UXpjRFZpU3Q3VEc3clM4OVhiQUZmTGtRR0hXdG1OOU9yZisyWUxIKzZOVy8v?=
 =?utf-8?B?YkY2MXF4MGUxUGh1T3drQW9PcVFwOVRSa1BpNTlqRzAxb28ybVE0c3lTYUM1?=
 =?utf-8?B?MXRFNHZxdE5iUlpqcW14b1BhRDFrUExVdkFzZnlLVzdLL2V2WE9zakU3WnFE?=
 =?utf-8?B?L0FTQWVLSlhUVCtXTXNVWHA2S21pdGhQVitkQjFxc3RCUDV1TDRta0p5QXhH?=
 =?utf-8?B?ZUVQRmZRVjhYVjZLN2F3R0NxcTF3eVJ0ZU01NGU4Z2hCdUZ1YmZSSjFGWkhC?=
 =?utf-8?B?b0J6ZVhEWEhiR1JNcUtKNkQ3Y0MreVFGMnhFWWZmM255cytnWStpbEpWV1hu?=
 =?utf-8?B?TjBGc1BtMGdXS0JlQWpEYkEydkFhZGJ1cFZyUElZOXpjQjZ0bnF1Q1VIbzAr?=
 =?utf-8?B?VkpKYlp2L2M0K1pxRUJ0RVVtdGQ4SWd1dEl4TGZrZWlvMklyWmdXbUsxQ2Ny?=
 =?utf-8?B?MFE4ZlBWRTN6SkUwQkIxdW9YdVd6M3ZTVnh2RG9XeVprOEJwbE9yVlU2Vjll?=
 =?utf-8?B?S0JGaG1NYk1Kc0hFdnNHdFkyVHhRazRDRyt0YjNobWhHd0ZzZTY1NnY4bW00?=
 =?utf-8?B?ZUd3eWF0Qm1yMWF0eE9CODJVUFJTZ1BEVEttMmovT0dpbjN5MS9EakN5T2l0?=
 =?utf-8?B?SGZ5TEZYYWtNUE5QUUJ5eHpWRm4wQVpSUndpZGdVYVdIOUI5RUszM2hyQzZV?=
 =?utf-8?B?TUJnTWxxbC8vUEJnMWJnd1F3UVdoY2FqcFQrZW8rQ29XN3NCdkVHR1pWdEph?=
 =?utf-8?B?cXVjYW91TmJRbUZ1Z0lZaTlGaDFuVVZBY0I5TXM2MGxOTERZT0xRaU1BRlVK?=
 =?utf-8?B?eDZ2T2ZNQ3o1d0xMRHVyZEJHeW16OU1hOHhIRXN5ZW5aOG84emIxUWRGTDNW?=
 =?utf-8?B?WnFNOFpVTUlKT2cwOENVWDdmVWZadXpVNmE0cGM1VG1JZG13ZVIwK2p5QmNC?=
 =?utf-8?B?US9JKzhlZkgyaEdWZlVoZEdLT2oxSitURm1PbzVXRFN4MzlDZ01MTUZXc3Rl?=
 =?utf-8?B?VFhhZHVTMWcrcTVhWUx2UnZQa2xZTFRNWlpJWGsyODF0TnY2V2lCK0RrQWR5?=
 =?utf-8?B?MmxPRGdUa3hiK0lGaXpYVzM5OE9zb0FHVGpjV0JZUHdNNzFtTlJHbHR6NWhx?=
 =?utf-8?B?STVSS3h0RUlqUVBySlkzeEovMjREMmJiVVpOTGNlRWZZRW1UeHBudW5Za1cz?=
 =?utf-8?Q?PIye6sswrg8Sk2CbTMQ9YNC+c?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a28fbf2-a2f1-48bd-2e37-08db4bbbc0cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2023 09:49:56.8267
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QY3IYaz108JictQhj/vA72SvDzA2dANfJ0vWT+gNdLS1NnfJbVaF500x5SyJSwc22ulIu7n941ZidMSzzxByrtMiuzcK96/FSN7+3BzQ9o4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11022
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggUkZDIDMvNl0gZHQtYmluZGluZ3M6IHJ0YzogaXNsMTIwODogQ29udmVydCB0byBqc29u
LQ0KPiBzY2hlbWENCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBXZWQsIE1heSAzLCAyMDIzIGF0
IDEwOjQ24oCvQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToN
Cj4gPiBDb252ZXJ0IHRoZSBpc2wxMjA4IFJUQyBkZXZpY2UgdHJlZSBiaW5kaW5nIGRvY3VtZW50
YXRpb24gdG8ganNvbi1zY2hlbWEuDQo+ID4NCj4gPiBVcGRhdGUgdGhlIGV4YW1wbGUgdG8gbWF0
Y2ggcmVhbGl0eS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5q
ekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4g
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3J0Yy9pc2lsLGlzbDEyMDgu
dHh0DQo+ID4gKysrIC9kZXYvbnVsbA0KPiA+IEBAIC0xLDM4ICswLDAgQEANCj4gPiAtSW50ZXJz
aWwgSVNMMTIwOS8xOSBJMkMgUlRDL0FsYXJtIGNoaXAgd2l0aCBldmVudCBpbg0KPiA+IC0NCj4g
PiAtSVNMMTJYOSBoYXZlIGFkZGl0aW9uYWwgcGlucyBFVklOIGFuZCAjRVZERVQgZm9yIHRhbXBl
ciBkZXRlY3Rpb24sDQo+ID4gd2hpbGUgdGhlDQo+ID4gLUlTTDEyMDggYW5kIElTTDEyMTggZG8g
bm90LiAgVGhleSBhcmUgYWxsIHVzZSB0aGUgc2FtZSBkcml2ZXIgd2l0aA0KPiA+IHRoZSBiaW5k
aW5ncyAtZGVzY3JpYmVkIGhlcmUsIHdpdGggY2hpcCBzcGVjaWZpYyBwcm9wZXJ0aWVzIGFzIG5v
dGVkLg0KPiA+IC0NCj4gPiAtUmVxdWlyZWQgcHJvcGVydGllcyBzdXBwb3J0ZWQgYnkgdGhlIGRl
dmljZToNCj4gPiAtIC0gImNvbXBhdGlibGUiOiBTaG91bGQgYmUgb25lIG9mIHRoZSBmb2xsb3dp
bmc6DQo+ID4gLSAgICAgICAgICAgICAgIC0gImlzaWwsaXNsMTIwOCINCj4gPiAtICAgICAgICAg
ICAgICAgLSAiaXNpbCxpc2wxMjA5Ig0KPiA+IC0gICAgICAgICAgICAgICAtICJpc2lsLGlzbDEy
MTgiDQo+ID4gLSAgICAgICAgICAgICAgIC0gImlzaWwsaXNsMTIxOSINCj4gPiAtIC0gInJlZyI6
IEkyQyBidXMgYWRkcmVzcyBvZiB0aGUgZGV2aWNlDQo+ID4gLQ0KPiA+IC1PcHRpb25hbCBwcm9w
ZXJ0aWVzOg0KPiA+IC0gLSAiaW50ZXJydXB0LW5hbWVzIjogbGlzdCB3aGljaCBtYXkgY29udGFp
bnMgImlycSIgYW5kICJldmRldCINCj4gPiAtICAgICAgIGV2ZGV0IGFwcGxpZXMgdG8gaXNsMTIw
OSBhbmQgaXNsMTIxOSBvbmx5DQo+ID4gLSAtICJpbnRlcnJ1cHRzIjogbGlzdCBvZiBpbnRlcnJ1
cHRzIGZvciAiaXJxIiBhbmQgImV2ZGV0Ig0KPiA+IC0gICAgICAgZXZkZXQgYXBwbGllcyB0byBp
c2wxMjA5IGFuZCBpc2wxMjE5IG9ubHkNCj4gPiAtIC0gImlzaWwsZXYtZXZpZW5iIjogRW5hYmxl
IG9yIGRpc2FibGUgaW50ZXJuYWwgcHVsbCBvbiBFVklOIHBpbg0KPiA+IC0gICAgICAgQXBwbGll
cyB0byBpc2wxMjA5IGFuZCBpc2wxMjE5IG9ubHkNCj4gPiAtICAgICAgIFBvc3NpYmxlIHZhbHVl
cyBhcmUgMCBhbmQgMQ0KPiA+IC0gICAgICAgVmFsdWUgMCBlbmFibGVzIGludGVybmFsIHB1bGwt
dXAgb24gZXZpbiBwaW4sIDEgZGlzYWJsZXMgaXQuDQo+ID4gLSAgICAgICBEZWZhdWx0IHdpbGwg
bGVhdmUgdGhlIG5vbi12b2xhdGlsZSBjb25maWd1cmF0aW9uIG9mIHRoZSBwdWxsdXANCj4gPiAt
ICAgICAgIGFzIGlzLg0KPiA+IC0NCj4gPiAtRXhhbXBsZSBpc2wxMjE5IG5vZGUgd2l0aCAjSVJR
IHBpbiBjb25uZWN0ZWQgdG8gU29DIGdwaW8xIHBpbjEyIGFuZA0KPiA+ICNFVkRFVCBwaW4gLWNv
bm5lY3RlZCB0byBTb0MgZ3BpbzIgcGluIDI0IGFuZCBpbnRlcm5hbCBwdWxsLXVwIGVuYWJsZWQg
aW4NCj4gRVZJTiBwaW4uDQo+ID4gLQ0KPiA+IC0gICAgICAgaXNsMTIxOTogcnRjQDY4IHsNCj4g
PiAtICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJpc2lsLGlzbDEyMTkiOw0KPiA+IC0gICAg
ICAgICAgICAgICByZWcgPSA8MHg2OD47DQo+ID4gLSAgICAgICAgICAgICAgIGludGVycnVwdC1u
YW1lcyA9ICJpcnEiLCAiZXZkZXQiOw0KPiA+IC0gICAgICAgICAgICAgICBpbnRlcnJ1cHRzLWV4
dGVuZGVkID0gPCZncGlvMSAxMiBJUlFfVFlQRV9FREdFX0ZBTExJTkc+LA0KPiA+IC0gICAgICAg
ICAgICAgICAgICAgICAgIDwmZ3BpbzIgMjQgSVJRX1RZUEVfRURHRV9GQUxMSU5HPjsNCj4gPiAt
ICAgICAgICAgICAgICAgaXNpbCxldi1ldmllbmIgPSA8MT47DQo+ID4gLSAgICAgICB9Ow0KPiA+
IC0NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3J0
Yy9pc2lsLGlzbDEyMDgueWFtbA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3J0Yy9pc2lsLGlzbDEyMDgueWFtbA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4g
aW5kZXggMDAwMDAwMDAwMDAwLi4wNGQ1MTg4Nzg1NWYNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3J0Yy9pc2lsLGlzbDEyMDgu
eWFtbA0KPiA+IEBAIC0wLDAgKzEsNzQgQEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpICVZQU1MIDEuMg0KPiA+ICstLS0NCj4g
PiArJGlkOg0KPiA+ICtodHRwczovL2pwbjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2su
Y29tLz91cmw9aHR0cCUzQSUyRiUyRmRldmkNCj4gPiArY2V0cmVlLm9yZyUyRnNjaGVtYXMlMkZy
dGMlMkZpc2lsJTJDaXNsMTIwOC55YW1sJTIzJmRhdGE9MDUlN0MwMSU3Q2JpDQo+ID4gK2p1LmRh
cy5qeiU0MGJwLnJlbmVzYXMuY29tJTdDMzIxZjYyNzMwYmMyNGYwNzZhZjYwOGRiNGJiODYxZmEl
N0M1M2Q4Mg0KPiA+ICs1NzFkYTE5NDdlNDljYjQ2MjVhMTY2YTRhMmElN0MwJTdDMCU3QzYzODE4
NzAyNzUxMTQ5MTgzNiU3Q1Vua25vd24lN0MNCj4gPiArVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3
TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWDQo+ID4gK0NJNk1u
MCUzRCU3QzMwMDAlN0MlN0MlN0Mmc2RhdGE9d3p4eWg0VnRHUjhaSHBpclVJWDA0Wm83YWFqNmph
U2NBdkQwVQ0KPiA+ICs4c2ZvWGclM0QmcmVzZXJ2ZWQ9MA0KPiA+ICskc2NoZW1hOg0KPiA+ICto
dHRwczovL2pwbjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cCUz
QSUyRiUyRmRldmkNCj4gPiArY2V0cmVlLm9yZyUyRm1ldGEtc2NoZW1hcyUyRmNvcmUueWFtbCUy
MyZkYXRhPTA1JTdDMDElN0NiaWp1LmRhcy5qeiU0DQo+ID4gKzBicC5yZW5lc2FzLmNvbSU3QzMy
MWY2MjczMGJjMjRmMDc2YWY2MDhkYjRiYjg2MWZhJTdDNTNkODI1NzFkYTE5NDdlNA0KPiA+ICs5
Y2I0NjI1YTE2NmE0YTJhJTdDMCU3QzAlN0M2MzgxODcwMjc1MTE0OTE4MzYlN0NVbmtub3duJTdD
VFdGcGJHWnNiM2QNCj4gPiArOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxD
SkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3DQo+ID4gK0MzMDAwJTdDJTdDJTdDJnNkYXRh
PTR3V0N2MjNjTHlPJTJCU0RhNE5nNHB0dWNpSFolMkJObyUyRm96b1JMS0liVXRuTQ0KPiA+ICtB
JTNEJnJlc2VydmVkPTANCj4gPiArDQo+ID4gK3RpdGxlOiBJbnRlcnNpbCBJU0wxMnswOCwwOSwx
OCwxOX0gSTJDIFJUQy9BbGFybSBjaGlwDQo+ID4gKw0KPiA+ICttYWludGFpbmVyczoNCj4gPiAr
ICAtIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiArICAtIFRyZW50
IFBpZXBobyA8dHBpZXBob0BpbXBpbmouY29tPg0KPiA+ICsNCj4gPiArcHJvcGVydGllczoNCj4g
PiArICBjb21wYXRpYmxlOg0KPiA+ICsgICAgb25lT2Y6DQo+ID4gKyAgICAgIC0gZW51bToNCj4g
PiArICAgICAgICAgIC0gaXNpbCxpc2wxMjA4DQo+ID4gKyAgICAgICAgICAtIGlzaWwsaXNsMTIw
OQ0KPiA+ICsgICAgICAgICAgLSBpc2lsLGlzbDEyMTgNCj4gPiArICAgICAgICAgIC0gaXNpbCxp
c2wxMjE5DQo+ID4gKw0KPiA+ICsgIHJlZzoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0K
PiA+ICsgIGludGVycnVwdHM6DQo+ID4gKyAgICBtaW5JdGVtczogMQ0KPiA+ICsgICAgbWF4SXRl
bXM6IDINCj4gPiArDQo+ID4gKyAgaW50ZXJydXB0LW5hbWVzOg0KPiA+ICsgICAgaXRlbXM6DQo+
ID4gKyAgICAgIC0gY29uc3Q6IGlycQ0KPiA+ICsgICAgICAtIGNvbnN0OiBldmRldA0KPiA+ICsN
Cj4gPiArICBpc2lsLGV2LWV2aWVuYjoNCj4gPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlh
bWwjL2RlZmluaXRpb25zL3VpbnQzMg0KPiA+ICsgICAgZW51bTogWyAwLCAxIF0NCj4gPiArICAg
IGRlZmF1bHQ6IDANCj4gPiArICAgIGRlc2NyaXB0aW9uOiB8DQo+ID4gKyAgICAgIEVuYWJsZSBv
ciBkaXNhYmxlIGludGVybmFsIHB1bGwgb24gRVZJTiBwaW46DQo+ID4gKyAgICAgICAgPDA+IDog
RW5hYmxlIGludGVybmFsIHB1bGwtdXANCj4gPiArICAgICAgICA8MT4gOiBEaXNhYmxlIGludGVy
bmFsIHB1bGwtdXANCj4gPiArDQo+ID4gK3JlcXVpcmVkOg0KPiA+ICsgIC0gY29tcGF0aWJsZQ0K
PiA+ICsgIC0gcmVnDQo+ID4gKw0KPiA+ICthbGxPZjoNCj4gPiArICAtICRyZWY6IHJ0Yy55YW1s
Iw0KPiA+ICsgIC0gaWY6DQo+ID4gKyAgICAgIHByb3BlcnRpZXM6DQo+ID4gKyAgICAgICAgY29t
cGF0aWJsZToNCj4gPiArICAgICAgICAgIGNvbnRhaW5zOg0KPiA+ICsgICAgICAgICAgICBlbnVt
Og0KPiA+ICsgICAgICAgICAgICAgIC0gaXNpbCxpc2wxMjA5DQo+ID4gKyAgICAgICAgICAgICAg
LSBpc2lsLGlzbDEyMTkNCj4gPiArICAgIHRoZW46DQo+ID4gKyAgICAgIHJlcXVpcmVkOg0KPiA+
ICsgICAgICAgIC0gaW50ZXJydXB0cy1leHRlbmRlZA0KPiANCj4gaW50ZXJydXB0cyAoLWV4dGVu
ZGVkIGlzIGhhbmRsZWQgYnkgdGhlIHRvb2xpbmcpDQoNCkkgZ290IGJpbmRpbmcgY2hlY2sgd2Fy
bmluZyBmb3IgdGhlIGV4YW1wbGUsIHdoZXJlIEkgdXNlZCBleGFtcGxlIHdpdGggY29tcGxleCBj
YXNlDQp3aXRoIGludGVycnVwdHMtZXh0ZW5kZWQgcHJvcGVydHkuDQoNCj4gDQo+ID4gKyAgICAg
ICAgLSBpbnRlcnJ1cHQtbmFtZXMNCj4gPiArICAgICAgICAtIGlzaWwsZXYtZXZpZW5iDQo+IA0K
PiBlbHNlIGludGVycnVwdHMgbWF4aXRlbXMgMT8NCg0KT0sgSSB3aWxsIGFkZCBpdCBpbiBuZXh0
IHZlcnNpb24uIE1vc3Qgb2YgdGhlIGR0cyBkb2Vzbid0IGRlZmluZSBpbnRlcnJ1cHRzLiBTaW5j
ZSBpdCBpcyBvcHRpb25hbA0KSXQgaXMgT2suDQoNCj4gDQo+ID4gKw0KPiA+ICt1bmV2YWx1YXRl
ZFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICtleGFtcGxlczoNCj4gPiArICAtIHwNCj4g
PiArICAgIGkyYyB7DQo+ID4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ID4gKyAg
ICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQo+ID4gKw0KPiA+ICsgICAgICAgIHJ0Y190d2k6IHJ0
Y0A2ZiB7DQo+ID4gKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiaXNpbCxpc2wxMjA4IjsNCj4g
PiArICAgICAgICAgICAgcmVnID0gPDB4NmY+Ow0KPiA+ICsgICAgICAgIH07DQo+IA0KPiBJcyB0
aGVyZSBhbnkgc3BlY2lmaWMgcmVhc29uIHlvdSBjaGFuZ2VkIHRoZSBleGFtcGxlIGZyb20gdGhl
IG1vc3QgY29tcGxleA0KPiB0byB0aGUgbW9zdCBzaW1wbGVzdCBjYXNlPw0KDQpJIGRpZCBub3Qg
ZmluZCBhY3R1YWwgZHRzIHdpdGggY29tcGxleCB1c2UgY2FzZSBpbiB0aGUga2VybmVsIHRyZWUu
DQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gPiArICAgIH07DQo+ID4gLS0NCj4gPiAyLjI1LjEN
Cj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAg
R2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2Yg
TGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBw
ZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2Vs
ZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0
IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UNCj4gdGhhdC4NCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K

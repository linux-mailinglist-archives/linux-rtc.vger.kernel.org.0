Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2B5D70481D
	for <lists+linux-rtc@lfdr.de>; Tue, 16 May 2023 10:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230401AbjEPIqv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 May 2023 04:46:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231236AbjEPIqu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 16 May 2023 04:46:50 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2134.outbound.protection.outlook.com [40.107.114.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40322AD;
        Tue, 16 May 2023 01:46:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jz7607+xtHzNhO3E9OkzUIUJjptlfKM3qRAZEpOEixTbwfofecDsNz/WhzXN2wfYsr5kwmV6Np3bEuICxtyB8Tqtjuk+Ly4PBoziHbUqcQsta7LxY9STwfxpFndGPvWdgif2//BAtch4iYBV10WsXmSVSXpTjHWm3c6BBbEK2IseLVrQF7U8ecMP6vY8XRq2oWgNon6r2PltEXWxhfxij4trv1SkiwvW3QwtUckV6EFzg/Tnqql9AdVVUi2P/eJv8SJccbX6eoGTGJkbkAXcoIej/+zgOFI2rMzt7Q99NPwCKaOwlVaQ0OHWNtAd9vc3+GHwG9POpq5g0RttPmC3pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wccNMaxhGvFTgkQY92vOPe+ljQPqybnCOFh5VISYQ4g=;
 b=HI4vNE44EgY8bySPhVdiXWcet2jqeLc/uVSE4gC6CYINOr3sBLmSjFaY7NM5DdvTXWoe0rF8bWllOE1GZIYgKNUXyAH5Hak1wArIMUK7WvdLRRvBlv1mWiuKFcH1xdg5AMzDBmYvBOZTlvcYTRfaRU234GiJVO+eHgZ56cE0iXjWYZSKIR76bwakqQl78nL2a8vM2s70qBCGUqXdA8IpRGltj/4n+H6DMxjctYiQ4IhjY6Dalyo95N3TGCLPaq4YkbTKksalJhZzkcEYvmZ1zrGCeE0j+5xkAwJb+PicPaaajURbtlbIIwEAC8vGTfLsF/oucrJEJCfMKO+Kjojm9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wccNMaxhGvFTgkQY92vOPe+ljQPqybnCOFh5VISYQ4g=;
 b=arG1N2rCpbRV046VJIlIwa7DSGQWp7Vj22TPjKLKhhf745QrVmFN1VenuPfUXgNh+nJTb5MIJQoxi1Dl4uzC49dta018w9WK31oKkVSg+pGoprT2jzd1Ga55sxtp8BRzj9U4O4+i2q5FgQvQ7UmjsDP1kR8oVPbfkabh6zj/iOE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB9777.jpnprd01.prod.outlook.com (2603:1096:400:22e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.32; Tue, 16 May
 2023 08:46:45 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 08:46:45 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Lee Jones <lee@kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH v3 2/5] rtc: isl1208: Add support for the built-in RTC on
 the PMIC RAA215300
Thread-Topic: [PATCH v3 2/5] rtc: isl1208: Add support for the built-in RTC on
 the PMIC RAA215300
Thread-Index: AQHZhbtZvbD5d59xcUG/7sk4bHrDF69ckNSAgAADcqA=
Date:   Tue, 16 May 2023 08:46:45 +0000
Message-ID: <OS0PR01MB592259C10181D3A9B590CA8186799@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230513165227.13117-1-biju.das.jz@bp.renesas.com>
 <20230513165227.13117-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdWWsNdewjug8JEpbwy1jFQqVEoioBctvQEHzjiLQzx7uQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWWsNdewjug8JEpbwy1jFQqVEoioBctvQEHzjiLQzx7uQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB9777:EE_
x-ms-office365-filtering-correlation-id: 74b1b50d-9b51-4b67-a279-08db55ea1431
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bVfnAJnFN8akj6i2VHSfhpbvphx6QIBfz/w7K8cToifQ4rezWtr4GjOelZX8paGJR6NKS6qvCiIrd5z8xYVZ645mqvISxfAjLDtlck7m34Zu8G4EfLFVMvMKPxHqMY9jzf0pVrv80+d+ymgjhnjKDdwdx2jWWiz/CQxOc+Wybb5YHC6bkpbjLYqFw2ivmujUOAVFg+QKE+Nq6ArHtXl6DeksUpiR5LnlwseJr7L2QDtJIimDrtpy6GCHzC/PiQwxgsN9ut71+dVCgycdLxa48JLdIcoJ5p2d7k/tCDIfsf21AdScDwyavJ0wkPBrLLQkf4PCOinJYI/UiOortFyPlq0/Vfk8UORCswwcBaW9rNDm5DOFEk4TnKUlNC2RW5AlFOKe0hvlO86+xiDeLSVlounG85+nXQ5Ug6uHeg1pgp+lDu9EyZxyg6+i1IJb/t2l//cMKHOXgxN+cbftMor3nXBQKutgvktFE4Jr1eu+BRyMOzF/0Xs0+QPLfYn0ZGY38dZvIhoyeFozXw3C2B5rfGskBq/48J9mDyDlnYaMubPU+AUNgY9qALlk1e8zPMDcogwQ89omQY9oldJ2EK0H3tfUYpttfUgtPcdD3x/bdEmoYzKkohxRYAsjqwfVoz6i
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(136003)(39860400002)(396003)(376002)(451199021)(26005)(107886003)(6506007)(9686003)(53546011)(83380400001)(122000001)(38100700002)(33656002)(38070700005)(86362001)(186003)(55016003)(7696005)(54906003)(478600001)(2906002)(316002)(41300700001)(52536014)(5660300002)(64756008)(66476007)(66556008)(66446008)(4326008)(6916009)(8676002)(76116006)(66946007)(8936002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3gvNDdzdVMvUWNjK2JaTlVZTXlhQUhEME13Q1lRQzYzTlZPbWF1cFYvLy9q?=
 =?utf-8?B?WFEzWE5pZTI4a1RXcS9zeWt6RmtSb3piMlpqWWlBbEprUVpRTVFLUnRPcSsy?=
 =?utf-8?B?aWtUVFZMa3Myd0xEN25aL1Ywdi9nL2p4RXNlb3FRK0VCb2tLVnhISStuSHhm?=
 =?utf-8?B?YThkRzJQNml2akVVUCtINU5DdDgrOVhTclc3Ukp1R3g0UTdrNEJtVHBlSzJX?=
 =?utf-8?B?a2h2dzB0WThVUkpuOFU4VFV3UkJLNlp3ZWh2cnZWS3lTSE1tQWsvTWVYQStp?=
 =?utf-8?B?OE9OT0NyNUp5Vkt6VXRrREw1bGF5QW9SYldwY1RyTENlT3dKd3NRa0NDZW1D?=
 =?utf-8?B?QlJpcjJpMzZ1SkdXTTluRGFubWdsR290VUtDSTJQK3VUWk9FYnBlckFTVXRv?=
 =?utf-8?B?dWtOSFdlTU44WVFjbWcrR0pmNkxsM21sd2ZYdjdpV1NTRmt4VFY5U3FQRUIv?=
 =?utf-8?B?U2lMUkxHZDYzcVpIMEhpaUpFS2wrUHVEMmlnOVlwaUd6cTlVQXU2RlI0SGtz?=
 =?utf-8?B?ZmNaSzI5YVNCTmJwSnFnMXUxdlh6WmZ3YVJkeUFkUXZmdDlMTlRaY0hySVlp?=
 =?utf-8?B?RTZVQjFFWUZtMHpVZS9NNDJwT3YvbERJTzEyYm43T2pCM3kzakpnNDlSelRp?=
 =?utf-8?B?c05pbmNmU1M1NFdHREt1SVJkVm9hT2NIWTF3QkhzL2VDVmo5YUczdkNYenhL?=
 =?utf-8?B?VHA5a0ZxU000QnRSOGJwbXJETmUrc0NVUTJNcDlFbnNvd2ZXQ1Zpem5jWWU4?=
 =?utf-8?B?Ty9POFA0bUxtUEFsTE5qbzZ6QXpIRTNWOWhZRThQT1ljU3I1cDdpNGp5UTRi?=
 =?utf-8?B?SXZVTlZiaktSUnJLcEI4UDgzQVJaWjEzU0RyQ2xTeDhJWEJDQ1ZmY2VsVnNw?=
 =?utf-8?B?ZmgzZW1wbjl4MDJWYXhNdEVPTkRoWlNYYmFqRGdMTmw5OU8zZEVqdStldnJ0?=
 =?utf-8?B?MUtiRGgyNW5BTm1RS25DbG81VDRrOUFVbEJRSFloYWR0aE84TWYxNDhJaDJj?=
 =?utf-8?B?NXlkbi9TZ2Nod3BvRy9DNWt0Y1NnTk5xeVYreHZYcEp4S09sS3V4ME92NjZ4?=
 =?utf-8?B?WE93a2VIaENHWERHSG1IU1l6RElvUXBTbnAvTDdCMnorV2NPSmU3OGI2OHhi?=
 =?utf-8?B?WkEyK2wwdUQrWlE0OVhzS3d3RWU5MitVQ2xqUEZ6WGcwN2RBWjFiZFVFM2xM?=
 =?utf-8?B?ZmduZG81VUJUY2JKSCtmeU4yOWhBdU54ZnNoMXViODVmZUFZOHRObm82Sk5T?=
 =?utf-8?B?SlpCOVhKaUNUU0pBQ2NISmNnSXFhM1hkcUI1MDhSM3BINDQ3cmpSTllWb1FT?=
 =?utf-8?B?NkRqYmtVblp1WVk5SDNnQ3VPdUFtL0JPVVY1eEpLWVljKzFMdmFFMzdRL3g4?=
 =?utf-8?B?MmlHczlrZGw0Z05ObWgvbWtPZnZuYVlTNXBEazhGWnI5eGhEbWNhN3lOelRF?=
 =?utf-8?B?cERwaC9KVmIvN1NMNXlwc3lkS3hocDdHNDFxamp1cjgxQ0g0WFZpRlAxOHVr?=
 =?utf-8?B?V1lpbFk5SmpDR3FONzdnN0FydUQ5bUdtbFlzdWRmcEFpZVBmd2hTQVBseEp1?=
 =?utf-8?B?cVQzNi9KeEpTa0p5U1ZkOEZGbU11VHl1MDYzTXE4WE9rcTNZQXhTNjBOUVhL?=
 =?utf-8?B?d1FDNzJOL2dLTTYyOXdKQWtqRDI0blo0b0IvL0FoUUlCdEdJb0hnZTNLdi9y?=
 =?utf-8?B?UEZ3NStQUy9OREwvYWhYL3dsUFVYZ0d5b2VHUjVnTzdtTHVoeE16WVUxVFc4?=
 =?utf-8?B?eGZHSTRvbC94Z2RSQ29NQXhvSEVCTjZYVS9YLzlUdUQxWHF2Q3BnQmxUSXpR?=
 =?utf-8?B?bmExOFk3ZmhTMGlna2xhV281aWdDR2dkL0ZSOFB2aUpIRGlQeUs5MW0wZXZv?=
 =?utf-8?B?OFFWWGpra3lmLy9QL2F2dUxxeHhFSjliQWdUdFozRDJpUGFKYlNRZG5nWmRk?=
 =?utf-8?B?OTUwQ0N5NXRqMGNncTNvR3Q1dzV2Z1F2THZXNUVyc1JSam93SWNjTEZRd2Jl?=
 =?utf-8?B?RnljNnNXYWs0TGJzeURzd0tuM3pJOUJSVG5pcXRtRm5CVWw3WHZ5NGZyc2dD?=
 =?utf-8?B?WSsycnVSakYzak1PKzlnTVpsMWgvMDY5WDBNSUU5WW1hR2JXTDdjWnh6cE1D?=
 =?utf-8?Q?F3lCEY9zhC0g6L5GG5Ps7tDcj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74b1b50d-9b51-4b67-a279-08db55ea1431
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2023 08:46:45.2558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vbhBY1Tkdgvj4BvWX5zgF9zDCdhA+c+OC+l4/NLAvuW+/bFH53/v7KUKly1XjJ3ibGWR5v6CUquVbsFP42A5L488uZi8xZ8R8MT/sANo1Lk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9777
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
UEFUQ0ggdjMgMi81XSBydGM6IGlzbDEyMDg6IEFkZCBzdXBwb3J0IGZvciB0aGUgYnVpbHQtaW4N
Cj4gUlRDIG9uIHRoZSBQTUlDIFJBQTIxNTMwMA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFNh
dCwgTWF5IDEzLCAyMDIzIGF0IDY6NTLigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IFRoZSBidWlsdC1pbiBSVEMgZm91bmQgb24gUE1JQyBS
QUEyMTUzMDAgaXMgdGhlIHNhbWUgYXMgSVNMMTIwOC4NCj4gPiBIb3dldmVyLCB0aGUgZXh0ZXJu
YWwgb3NjaWxsYXRvciBiaXQgaXMgaW52ZXJ0ZWQgb24gUE1JQyB2ZXJzaW9uIDB4MTEuDQo+ID4g
VGhlIFBNSUMgZHJpdmVyIGRldGVjdHMgUE1JQyB2ZXJzaW9uIGFuZCBpbnN0YW50aWF0ZSBhcHBy
b3ByaWF0ZSBSVEMNCj4gPiBkZXZpY2UgYmFzZWQgb24gaTJjX2RldmljZV9pZC4NCj4gPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4g
PiAtLS0NCj4gPiB2Mi0+djM6DQo+ID4gICogUlRDIGRldmljZSBpcyBpbnN0YW50aWF0ZWQgYnkg
UE1JQyBkcml2ZXIgYW5kIGRyb3BwZWQNCj4gaXNsMTIwOF9wcm9iZV9oZWxwZXIoKS4NCj4gPiAg
KiBBZGRlZCAiVFlQRV9SQUEyMTUzMDBfUlRDX0EwIiB0byBoYW5kbGUgaW52ZXJ0ZWQgb3NjaWxs
YXRvciBiaXQNCj4gY2FzZS4NCj4gPiBSRkMtPnYyOg0KPiA+ICAqIERyb3BwZWQgY29tcGF0aWJs
ZSAicmVuZXNhcyxyYWEyMTUzMDAtaXNsMTIwOCIgYW5kDQo+ICJyZW5lc2FzLHJhYTIxNTMwMC1w
bWljIiBwcm9wZXJ0eS4NCj4gPiAgKiBVcGRhdGVkIHRoZSBjb21tZW50IHBvbGFyaXR5LT5iaXQg
Zm9yIEV4dGVybmFsIE9zY2lsbGF0b3IuDQo+ID4gICogQWRkZWQgcmFhMjE1MzAwX3J0Y19wcm9i
ZV9oZWxwZXIoKSBmb3IgcmVnaXN0ZXJpbmcgcmFhMjE1MzAwX3J0Yw0KPiBkZXZpY2UgYW5kDQo+
ID4gICAgYWRkZWQgdGhlIGhlbHBlciBmdW5jdGlvbiBpc2wxMjA4X3Byb2JlX2hlbHBlcigpIHRv
IHNoYXJlIHRoZSBjb2RlLg0KPiANCj4gVGhhbmtzIGZvciB0aGUgdXBkYXRlIQ0KPiANCj4gPiAt
LS0gYS9kcml2ZXJzL3J0Yy9ydGMtaXNsMTIwOC5jDQo+ID4gKysrIGIvZHJpdmVycy9ydGMvcnRj
LWlzbDEyMDguYw0KPiA+IEBAIC03NCw2ICs3NCw3IEBAIGVudW0gaXNsMTIwOF9pZCB7DQo+ID4g
ICAgICAgICBUWVBFX0lTTDEyMDksDQo+ID4gICAgICAgICBUWVBFX0lTTDEyMTgsDQo+ID4gICAg
ICAgICBUWVBFX0lTTDEyMTksDQo+ID4gKyAgICAgICBUWVBFX1JBQTIxNTMwMF9SVENfQTAsDQo+
ID4gICAgICAgICBJU0xfTEFTVF9JRA0KPiA+ICB9Ow0KPiA+DQo+ID4gQEAgLTgzLDExICs4NCwx
MyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGlzbDEyMDhfY29uZmlnIHsNCj4gPiAgICAgICAgIHVu
c2lnbmVkIGludCAgICBudm1lbV9sZW5ndGg7DQo+ID4gICAgICAgICB1bnNpZ25lZCAgICAgICAg
aGFzX3RhbXBlcjoxOw0KPiA+ICAgICAgICAgdW5zaWduZWQgICAgICAgIGhhc190aW1lc3RhbXA6
MTsNCj4gPiArICAgICAgIHVuc2lnbmVkICAgICAgICBoYXNfaW52ZXJ0ZWRfb3NjX2JpdDoxOw0K
PiA+ICB9IGlzbDEyMDhfY29uZmlnc1tdID0gew0KPiA+ICAgICAgICAgW1RZUEVfSVNMMTIwOF0g
PSB7ICJpc2wxMjA4IiwgMiwgZmFsc2UsIGZhbHNlIH0sDQo+ID4gICAgICAgICBbVFlQRV9JU0wx
MjA5XSA9IHsgImlzbDEyMDkiLCAyLCB0cnVlLCAgZmFsc2UgfSwNCj4gPiAgICAgICAgIFtUWVBF
X0lTTDEyMThdID0geyAiaXNsMTIxOCIsIDgsIGZhbHNlLCBmYWxzZSB9LA0KPiA+ICAgICAgICAg
W1RZUEVfSVNMMTIxOV0gPSB7ICJpc2wxMjE5IiwgMiwgdHJ1ZSwgIHRydWUgfSwNCj4gPiArICAg
ICAgIFtUWVBFX1JBQTIxNTMwMF9SVENfQTBdID0geyAicnRjX2EwIiwgMiwgZmFsc2UsIGZhbHNl
LCB0cnVlIH0sDQo+ID4gIH07DQo+ID4NCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfZGV2
aWNlX2lkIGlzbDEyMDhfaWRbXSA9IHsgQEAgLTk1LDYgKzk4LDcgQEANCj4gPiBzdGF0aWMgY29u
c3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgaXNsMTIwOF9pZFtdID0gew0KPiA+ICAgICAgICAgeyAi
aXNsMTIwOSIsIFRZUEVfSVNMMTIwOSB9LA0KPiA+ICAgICAgICAgeyAiaXNsMTIxOCIsIFRZUEVf
SVNMMTIxOCB9LA0KPiA+ICAgICAgICAgeyAiaXNsMTIxOSIsIFRZUEVfSVNMMTIxOSB9LA0KPiA+
ICsgICAgICAgeyAicnRjX2EwIiwgVFlQRV9SQUEyMTUzMDBfUlRDX0EwIH0sDQo+IA0KPiAicnRj
X2EwIiBpcyBJTUhPIGEgdG9vLWdlbmVyaWMgbmFtZS4NCg0KSSB0cmllZCB0byBzcXVlZXplIHdp
dGggc3RyaW5nIGxlbmd0aCAiOCIuDQoNCldoYXQgYWJvdXQgY2hhbmdpbmcgaXQgdG8gInJhYTIx
NTMwMF9hMCIgYW5kIGNoYW5naW5nIGxlbmd0aCB0bw0KIjEyIj8gYXMgdmVyc2lvbiBBMCBvZiBS
QUEyMTUzMDAgcG1pYyBjaGlwIGhhdmUgdGhpcyBpbnZlcnRlZCBvc2NpbGxhdG9yIGJpdC4NCg0K
PiANCj4gDQo+ID4gICAgICAgICB7IH0NCj4gPiAgfTsNCj4gPiAgTU9EVUxFX0RFVklDRV9UQUJM
RShpMmMsIGlzbDEyMDhfaWQpOyBAQCAtMTY2LDYgKzE3MCwxNiBAQA0KPiA+IGlzbDEyMDhfaTJj
X3ZhbGlkYXRlX2NsaWVudChzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0KPiA+ICAgICAgICAg
cmV0dXJuIDA7DQo+ID4gIH0NCj4gPg0KPiA+ICtzdGF0aWMgaW50DQo+ID4gK2lzbDEyMDhfc2V0
X2V4dGVybmFsX29zY2lsbGF0b3Ioc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwgaW50IHJjLA0K
PiANCj4gcy9yYy9zci8NCg0KQWdyZWVkLiBCdXQgSSBwbGFuIHRvIGRyb3AgdGhpcyBmdW5jdGlv
biBpbiBuZXh0IHZlcnNpb24uDQpQbGVhc2Ugc2VlIGJlbG93Lg0KDQo+IA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBpc19pbnZlcnRlZF9vc2NpbGxhdG9yX2JpdCkg
ew0KPiA+ICsgICAgICAgaWYgKGlzX2ludmVydGVkX29zY2lsbGF0b3JfYml0KQ0KPiANCj4gVGhp
cyBjb25kaXRpb24gaXMgYWx3YXlzIHRydWUsIGdpdmVuIGFsbCBjYWxsZXJzIGluIHlvdXIgc2Vy
aWVzLg0KDQpPay4NCg0KPiANCj4gPiArICAgICAgICAgICAgICAgcmMgfD0gSVNMMTIwOF9SRUdf
U1JfWFRPU0NCOw0KPiANCj4gSWYgeW91IGRvIGRlY2lkZSB0byBrZWVwIGl0LCB5b3UgcHJvYmFi
bHkgd2FudCB0byBhZGQgYW4gZWxzZSBicmFuY2ggdG8NCj4gbWFrZSBzdXJlIHRoZSBiaXQgaXMg
Y2xlYXJlZC4NCg0KTm8sIEkgYW0gcGxhbm5pbmcgdG8gZHJvcCBpdC4gUGxlYXNlIHNlZSBiZWxv
dy4NCg0KDQo+IA0KPiA+ICsNCj4gPiArICAgICAgIHJldHVybiBpMmNfc21idXNfd3JpdGVfYnl0
ZV9kYXRhKGNsaWVudCwgSVNMMTIwOF9SRUdfU1IsIHJjKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAg
c3RhdGljIGludA0KPiA+ICBpc2wxMjA4X2kyY19nZXRfc3Ioc3RydWN0IGkyY19jbGllbnQgKmNs
aWVudCkgIHsgQEAgLTg0NSw2ICs4NTksMTMgQEANCj4gPiBpc2wxMjA4X3Byb2JlKHN0cnVjdCBp
MmNfY2xpZW50ICpjbGllbnQpDQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiByYzsNCj4gPiAg
ICAgICAgIH0NCj4gPg0KPiA+ICsgICAgICAgaWYgKGlzbDEyMDgtPmNvbmZpZy0+aGFzX2ludmVy
dGVkX29zY19iaXQpIHsNCj4gPiArICAgICAgICAgICAgICAgcmMgPSBpc2wxMjA4X3NldF9leHRl
cm5hbF9vc2NpbGxhdG9yKGNsaWVudCwgcmMsDQo+IA0KPiBQYXNzaW5nICJyYyIgaXMgY29uZnVz
aW5nLCB0aGlzIGlzIHJlYWxseSB0aGUgc3RhdHVzIHJlZ2lzdGVyIHZhbHVlDQo+IG9idGFpbmVk
IGFib3ZlLi4uDQoNCkkgYW0gcGxhbm5pbmcgdG8gZHJvcCB0aGlzIGZ1bmN0aW9uIGluIG5leHQg
dmVyc2lvbiBhbmQgd2lsbCB1c2UgdGhlIGJlbG93IGxvZ2ljIGluc3RlYWQuDQpJcyBpdCBvaz8N
Cg0KICAgICAgICAgaWYgKGlzbDEyMDgtPmNvbmZpZy0+aGFzX2ludmVydGVkX29zY19iaXQpIHsg
ICANCgkJICAgIGludCBzcjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgDQogICAgICAgICAg
ICAgICAgIHNyID0gaTJjX3NtYnVzX3dyaXRlX2J5dGVfZGF0YShjbGllbnQsIElTTDEyMDhfUkVH
X1NSLCAgICAgICAgICAgDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcmMgfCBJU0wxMjA4X1JFR19TUl9YVE9TQ0IpOyAgICAgIA0KICAgICAgICAgICAgICAg
ICBpZiAoc3IpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIA0KICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBzcjsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KICAgICAgICAgfSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIA0KICAgICAgICAgICANCg0KPiANCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlzbDEyMDgtPmNvbmZpZy0NCj4gPmhhc19pbnZl
cnRlZF9vc2NfYml0KTsNCj4gPiArICAgICAgICAgICAgICAgaWYgKHJjKQ0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgIHJldHVybiByYzsNCj4gDQo+IElmIHdlIGdldCBoZXJlLCByYyBpcyBh
bHdheXMgemVybyAuLi4NCj4gDQo+ID4gKyAgICAgICB9DQo+ID4gKw0KPiA+ICAgICAgICAgaWYg
KHJjICYgSVNMMTIwOF9SRUdfU1JfUlRDRikNCj4gDQo+IC4uLiB0aHVzIGJyZWFraW5nIHRoaXMg
Y2hlY2suLg0KDQpPb3BzLCBtaXNzZWQgaXQuDQoNCkNoZWVycywNCkJpanUNCg0K

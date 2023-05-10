Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 612F16FDDFC
	for <lists+linux-rtc@lfdr.de>; Wed, 10 May 2023 14:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236900AbjEJMmX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 10 May 2023 08:42:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235768AbjEJMmW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 10 May 2023 08:42:22 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2125.outbound.protection.outlook.com [40.107.113.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEF4610E5;
        Wed, 10 May 2023 05:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CYG5XZh7Ix/wJ2VYxz3KqgzgPZ3WkTHtYc2Qxc4QBRxcuc04Z3OhdUOHSsDvKiIGIEP1L89bC1IJAWCk8KGWuiDbGHYv8uuOyOd1Tc2I5myr1D1sdRcnjfBnDjacrUpbJO46K7kUXR9OmLJqap5MRZt1Oi5dWpkR3rGRC4cqW0bW43ZWERYDEQqufoX8wMehsXydJzaVXJcoVHYNbej5nDYSJBvtFjTq/tRxEMJDXqXx8DAtZJQCUMLXi70qt8AZyyS/04kCaBplSzu3OH3H7BfLcjI/DpnTeGI3TA+bOJTB6/lnPi5/u1/3ymr/1nYlM9l4Gs0+D4+Em+A6KF8NvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hFQaB+8ZZcsDg2OilaDxk4v6QEQpDeRDWjRxUYlWgPE=;
 b=flX28thF0mxspGPZMk1GlPol74n7Yd5QJP7jocypONbZ8ajAZDgTqf/dgI039lLySRTw0FBQfBOhXct0a4g589SL4U9qVySfJgGjznLwKPcWWGVZ+Kw7VEme5h8PrlsNSB+lcrxF11FmuRkR7/ZIaWyB70L3Bh1OqJ0BgzlVYYliJgGdV8a9BWHz4RR4cKgmuUi/pW36JC+TsRtNtXkCdnYjY223cfCn5hiI1hfiqRzPb9nADZG9NO2gh5DxJS0V1GzvVkP6Kj5/QzUggGbVnQ1NHsUWX2DAhxlN1A8FTXO8l2rVl7gU4eE3alttXhQmiTVon2wzMt2mN92LuCnZ2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFQaB+8ZZcsDg2OilaDxk4v6QEQpDeRDWjRxUYlWgPE=;
 b=W5eHb3nhgTnsI36t0dFhkNrb42wuwruRQc6S8vCm/Fjv+9bTB5ifzEOHh6UDw/Ez+o9Hsg8gMJyiV6EA+lvF3z39u/YX0ryFlFhBsMeGxp2oS3dgebtxEIHZMZpoYq9yUQAegApkEAuM/F+WTSBuE0d86EJTMLT/ZBgHY5lUZ9E=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB11103.jpnprd01.prod.outlook.com (2603:1096:400:3d3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.19; Wed, 10 May
 2023 12:42:16 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6387.019; Wed, 10 May 2023
 12:42:16 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Trent Piepho <tpiepho@gmail.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH v4] dt-bindings: rtc: isl1208: Convert to json-schema
Thread-Topic: [PATCH v4] dt-bindings: rtc: isl1208: Convert to json-schema
Thread-Index: AQHZgnf5UhDOi7L5ME+iJHLI6dBSHK9STQEAgAEiLHA=
Date:   Wed, 10 May 2023 12:42:16 +0000
Message-ID: <OS0PR01MB59225D0DB1F36E78FDC938E486779@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230509131249.80456-1-biju.das.jz@bp.renesas.com>
 <CA+7tXig2nwCk3DKwFEKGKVko=YD4e4KCpRVUMMM2pgPRpNgiiQ@mail.gmail.com>
In-Reply-To: <CA+7tXig2nwCk3DKwFEKGKVko=YD4e4KCpRVUMMM2pgPRpNgiiQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB11103:EE_
x-ms-office365-filtering-correlation-id: c32bf9ad-b752-47f6-402d-08db5153fc6f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MF0e3Wi8yOWX5RRLHLhsMRZ5NsLxwQXi48CwLwpCqdjj5Gl6N21mTAGFt5rpE0GI8cPSsMxgE6ZZVwgiW48J5GUuXMnU9ORTKR7cXHnocLFrGtUXuTLeVm05mdq13FDTPOFI9lAhfqL0OBHyvOEgpcd42gjs9jpQyzKWHa+agPr6wLxjbq6z2nPa1VGn/sSJP/rAr9/CMA1lNP0JrkytRlG0enbMLfb1NavYy3pb55hyAG4KcsLFe8LE+HNXfFt6LXXpivt3XrEREBFGuE41AqdRnamyQLUofN7O3O+tUucGH0p0jHCiwMbooCxJCQBd/s9eLJkPGmnTqjuXQziEVfaqelZd8xaolF8h5C1EefvA0OKFxD6RYJMspzW8bwmHv/Bz0sKDYJ/+MmQZdsAXNjmdLu8PPMXnUQOoBy61Sn1jFKvQD4MlVlPcN/CRVETfR4kzz2dlWVxn0U/EBmVBsRHtTICM2OzurC3bWg+YOluqAnbLSp5y2w9+uDHCmVxBSP4QP1fNwL2qDjpAZMn3ugtV9M664gHtec2xUnVF9kxyvvwoCIHoHRMQ9aEYZShPk75LXWe6lfTi0JfasGWgPjkohkcX/KQ1jjQHzNRjyLKs8kO2TodcC3lIxy614zTd
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(376002)(396003)(39860400002)(451199021)(83380400001)(2906002)(186003)(53546011)(9686003)(41300700001)(66556008)(6916009)(71200400001)(64756008)(66446008)(54906003)(316002)(66946007)(66476007)(4326008)(76116006)(478600001)(5660300002)(7416002)(52536014)(26005)(6506007)(8936002)(7696005)(8676002)(55016003)(38100700002)(38070700005)(122000001)(86362001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3hodkFPU0dtN2RMK2Rrd3BIVUhPQW1zM0RMUndBS3JYR0hzd2N2UU9nRVNN?=
 =?utf-8?B?bEkvcE02QlE2SVZzbXhxT0JGcHUwYXIzQlJ5cTRNZWlxMnVHSG01ZXRNMEF0?=
 =?utf-8?B?dndUYnNTUFJTS0NBKzg0c2JJa0kxTkpJRTFwTWlsVzJmMWV6cW1FbnFvRmlH?=
 =?utf-8?B?WmgvS0dVVm1sSWJlOW1lYmpVQ2hKTG1qU25LdEUxTGFySmovM2haaXhKWWp2?=
 =?utf-8?B?U0g0VmcwRGhFcG5hRzgxRlkzY2RWRUw1aFN0NnRPWGtpeG5XM2pJYm1iNUgz?=
 =?utf-8?B?WnJtNjB0ZWhvZzBYN2ZQU2tQNEE3WDRhOGVqM2w0SkdTdUErNDV4dmxnSGRG?=
 =?utf-8?B?dHZNaVhPMFgvNVZHZjYrRlBobDJaeWpTd09DbkpPYUVxek1rWWZ3VnNQQmE5?=
 =?utf-8?B?cVpmN3BLb2lwU0VuMk1GemgxMGJqRHhkWkZvZ0JHRHp0U3BKU1AxRWRCUWNs?=
 =?utf-8?B?eDVYdmtaaFg5ZU1FTC9SYzhaei9NSnFnLy84MkV0c1p4SythT2NVeC9VSzNr?=
 =?utf-8?B?cnJvYkNOYlRzWDk1c1g5TDVqMVhrSU0zdUJza1lVZ01ZYzExNFAxVVBpa2NS?=
 =?utf-8?B?bVd3MFQzZHdxanJPTkt1QXpBem5mQXl5OHRGVXZGM0dRNWE2NUc1eUN2UWJT?=
 =?utf-8?B?bXVVL2F5QUVOdnBrMzQreWZxSXlGUGxGYmdRUVhWckRCdVYvYnRTVlpCRllo?=
 =?utf-8?B?dWZhN0RGb01kdHNkcnpUL0hLSHpSS1Znck9DRDRObWV0WXhSZlpmOGpNcmhs?=
 =?utf-8?B?dVFPaE1uMFhGVE44cjRBNWVZa2hMSEFxaktDbnRGOG5GRUlFVFJjelRRN1pH?=
 =?utf-8?B?S0poa2RZSVYyN3IxSHFwbm11NEVvTFVrVERwRWFoUGsvZ0hIcmhqcW5MYVEw?=
 =?utf-8?B?UGJSRlcwVURtZjBoL2hqT0hKcjEwZlh3ekk0M1ZtMlJvT3ZzZE9IMFVxK24y?=
 =?utf-8?B?UzdOM2dYckcxOEZDV0I2Vk81QjgyZExXbnczK2R3Y0RFclNseHNIZngwQjVE?=
 =?utf-8?B?ZnZPSElqaTBxT2lTYUFSM2pJOUI1Y0JwR0lLd3BlaGtMZ1ZXK0c5MUtkM2xk?=
 =?utf-8?B?YXM2S0k0dTlzSUhpQ3hEbDRhVHBIYnZMSzhmeklaR2ltc1hOQ0dKVWZUNmFu?=
 =?utf-8?B?d1hDZFgwdjlROGtYMm1nbDFmZkJJak5aWTVlU294cGYzQlRtZnp3OWxIYXZt?=
 =?utf-8?B?QmlTbzJYYUZSR3Bla2JWTkJWMitUemVpdHNld2lpVnZmVG9MM1FBb3Yvc01l?=
 =?utf-8?B?SE9ZUFlsdjVab0JIckJhNXU3bDRyclJFbnQ3K1pJeVRKYjF4L3JuSkozRXU4?=
 =?utf-8?B?U3hWRnA3TURla3drMmZIbENpS09ZZCtQUUthY21QOGV0VzFYdXFsWndvYVpm?=
 =?utf-8?B?dlNybk80YS9sZTAzZEFJTm84M0lJa1RFWitCcDRHb2ZEYmFzMXduaUJRWW1t?=
 =?utf-8?B?RW9sN1o4dkVjYUFBTXk5anhEL3o1cTZSTC8rRWxsWWR6dlozWHZDS3FqVE1l?=
 =?utf-8?B?U1dPR09yOUliYU0rQ2dBS3pnUkhTTWpEZkxMdVJZRHA3UmMwSkl6N011amZx?=
 =?utf-8?B?cTVLWG42SUJyQTZYUjErdkRwTW8xWTZTTExEMEljanpTdEc1eDdZQ1d1TDNF?=
 =?utf-8?B?VkhUZHR2K0Z2RmR2dGJVZnl0bUFiTCt1ZjRrMFRXUmttT2IrSFNLald6Z0hD?=
 =?utf-8?B?QzIxOGFFeldONTh1cEJnWGdibVBDUjJMVW9FNG1tREI1bEN5eG94MGQrcEpk?=
 =?utf-8?B?R3A3dmw2ZFNkeVA4QS9kV3NIWndPTXByR3J4VkxVYUJQbG9kRTFqbXdFUVA0?=
 =?utf-8?B?T0pOcTNDMXRXZC9nZkxPeElGUlEzUThDVzFrREx2czZFbjhBRVVWWEo4SVFo?=
 =?utf-8?B?blZPd25uRWpNbHp0dkRodDVjTWI0K21sZ0U4dmVmaWNGcXFaY2JQVnFWZkFy?=
 =?utf-8?B?S1BUdDc1TFhrL0VzTitmZzloSndzU0J3cld6K0RmQ1NDSFlQckxBMEEzbHVa?=
 =?utf-8?B?WWc5SldLWi9JVk84QjgvcG9WancyZ2JzOXhhazBBdjdRK0RyOWlXa0VaR3V0?=
 =?utf-8?B?eE96THpjRXlZSi92Z1lZSnVHN2hJRXBOelZsbWdtTnlzRDd5UlBKTksrWFZz?=
 =?utf-8?Q?3DhS94TR4QI+BSdNA9cbYzbUF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c32bf9ad-b752-47f6-402d-08db5153fc6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2023 12:42:16.1854
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IjvNoq0hXP1IQPhhEiVNpn2h1ECnn+0YWLp8ZEdVROuHNe2yWp/uA2YTG70FdGQ2ctw6DUB9UngKtUWj1KBgwW/lMCXpamFLTq6ktLHfFyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11103
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGkgVHJlbnQgUGllcGhvLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IFRyZW50IFBpZXBobyA8dHBpZXBob0BnbWFpbC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE1heSA5
LCAyMDIzIDg6MDQgUE0NCj4gVG86IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4NCj4gQ2M6IEFsZXNzYW5kcm8gWnVtbW8gPGEuenVtbW9AdG93ZXJ0ZWNoLml0PjsgQWxleGFu
ZHJlIEJlbGxvbmkNCj4gPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPjsgUm9iIEhlcnJp
bmcgPHJvYmgrZHRAa2VybmVsLm9yZz47IEtyenlzenRvZg0KPiBLb3psb3dza2kgPGtyenlzenRv
Zi5rb3psb3dza2krZHRAbGluYXJvLm9yZz47IGxpbnV4LXJ0Y0B2Z2VyLmtlcm5lbC5vcmc7DQo+
IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3Jl
bmVzYXNAZ2xpZGVyLmJlPjsNCj4gRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm8uanpA
cmVuZXNhcy5jb20+OyBsaW51eC1yZW5lc2FzLQ0KPiBzb2NAdmdlci5rZXJuZWwub3JnOyBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjRdIGR0LWJpbmRpbmdzOiBydGM6IGlzbDEyMDg6IENvbnZlcnQgdG8g
anNvbi1zY2hlbWENCj4gDQo+IE9uIFR1ZSwgTWF5IDksIDIwMjMgYXQgNjoxMuKAr0FNIEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gKw0KPiA+ICsgIGlu
dGVycnVwdC1uYW1lczoNCj4gDQo+IFNob3VsZG4ndCB0aGlzIGhhdmUgbWluSXRlbXM6IDEgYW5k
IG1heEl0ZW1zOiAyIGFzIHdlbGw/DQo+IA0KPiA+ICsgICAgaXRlbXM6DQo+ID4gKyAgICAgIC0g
Y29uc3Q6IGlycQ0KPiA+ICsgICAgICAtIGNvbnN0OiBldmlkZW50DQo+IA0KPiANCj4gPiArDQo+
ID4gKyAgaXNpbCxldi1ldmllbmI6DQo+ID4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1s
Iy9kZWZpbml0aW9ucy91aW50MzINCj4gPiArICAgIGVudW06IFsgMCwgMSBdDQo+ID4gKyAgICBk
ZXNjcmlwdGlvbjogfA0KPiA+ICsgICAgICBFbmFibGUgb3IgZGlzYWJsZSBpbnRlcm5hbCBwdWxs
IG9uIEVWSU4gcGluDQo+ID4gKyAgICAgIERlZmF1bHQgd2lsbCBsZWF2ZSB0aGUgbm9uLXZvbGF0
aWxlIGNvbmZpZ3VyYXRpb24gb2YgdGhlIHB1bGx1cA0KPiA+ICsgICAgICBhcyBpcy4NCj4gPiAr
ICAgICAgICA8MD4gOiBFbmFibGVzIGludGVybmFsIHB1bGwtdXAgb24gZXZpbiBwaW4NCj4gPiAr
ICAgICAgICA8MT4gOiBEaXNhYmxlcyBpbnRlcm5hbCBwdWxsLXVwIG9uIGV2aW4gcGluDQo+IA0K
PiBJdCBhcHBlYXJzIHRoaXMgd2FzIG5vdCBjbGVhciBhdCBmaXJzdC4gIFRoZSBkZWZhdWx0IGlz
IG5vdCB0byB1c2UgdGhlIHJlc2V0DQo+IHZhbHVlLCB3aGljaCBpcyAwLCBidXQgdG8gbGVhdmUg
dGhlIGV4aXN0aW5nIHZhbHVlIHVuY2hhbmdlZC4NCj4gVGhlIFJUQyBzZXR0aW5ncyBhcmUgYmF0
dGVyeS1iYWNrZWQgYW5kIHRoZSBSVEMgaXMgbm90IHJlc2V0IG9uIGJvb3QgYnkgdGhlDQo+IGtl
cm5lbC4gIFRoZSB2YWx1ZSBtaWdodCBoYXZlIGJlZW4gc2V0IG9uIGEgcHJldmlvdXMgYm9vdCwg
b3IgbWlnaHQgaGF2ZQ0KPiBhbHJlYWR5IGJlZW4gY29uZmlndXJlZCBieSB0aGUgYm9vdGxvYWRl
ciBvciBCSU9TLiAgVGhpcyB3YXMgYSBjb21tb24gZGVzaWduDQo+IGluIExpbnV4IFJUQyBkcml2
ZXJzLiAgVGhlIGJvb3Rsb2FkZXIgd291bGQgY29uZmlndXJlIHRoZSBSVEMgYW5kIHRoZW4gTGlu
dXgNCj4gZHJpdmVyIHdhcyBvbmx5IGRlc2lnbiB0byBiZSBhYmxlIHRvIGdldC9zZXQgdGhlIHRp
bWUgYW5kIGFsYXJtcy4gIFN0dWZmDQo+IGxpa2UgcHJvZ3JhbW1pbmcgdGhlIGludGVycnVwdCBw
dWxsLXVwcyBvciBzZXR0aW5nIGNhbGlicmF0aW9uIHJlZ2lzdGVycw0KPiB3YXNuJ3QgZG9uZSBi
eSB0aGUga2VybmVsLg0KDQpUaGFua3MgZm9yIHRoZSBkZXRhaWxlZCBleHBsYW5hdGlvbi4gU28g
Y3VycmVudGx5IGFyZSB5b3Ugb2sgd2l0aCB0aGUgZGVzY3JpcHRpb24NCnJpZ2h0PyBvciBEbyB5
b3Ugd2FudCB0byBjaGFuZ2UgdGhpcyB3aXRoIGRldGFpbGVkIGV4cGxhbmF0aW9uPyBXZSBjYW4g
YWx3YXlzIGFkZA0KaW5jcmVtZW50YWwgcGF0Y2ggdG8gdXBkYXRlIHRoaXMgc2VjdGlvbiBsYXRl
ci4gVGhpcyBwYXRjaCBpcyBqdXN0IGNvbnZlcnNpb24NCmZyb20gdHh0IHRvIHlhbWwgYW5kIHRo
ZSBjb250ZW50IHNob3VsZCBiZSBzYW1lIGFzIHRoZSBvcmlnaW5hbCBvbmUgYXMgbXVjaCBhcyBw
b3NzaWJsZS4NCg0KUGxlYXNlIGxldCBtZSBrbm93Lg0KDQo+IA0KPiA+ICsgICAgdGhlbjoNCj4g
PiArICAgICAgcHJvcGVydGllczoNCj4gPiArICAgICAgICBpbnRlcnJ1cHRzOg0KPiA+ICsgICAg
ICAgICAgbWF4SXRlbXM6IDINCj4gPiArICAgIGVsc2U6DQo+ID4gKyAgICAgIHByb3BlcnRpZXM6
DQo+ID4gKyAgICAgICAgaW50ZXJydXB0czoNCj4gPiArICAgICAgICAgIG1heEl0ZW1zOiAxDQo+
IA0KPiBBZGQgaW50ZXJydXB0LW5hbWVzIGhlcmUgdG9vLg0KDQpCYXNlZCBvbiB0aGUgb3RoZXIg
bWFpbCB0aHJlYWQsIHdpbGwgdXBkYXRlIHRoaXMuDQoNCj4gDQo+ID4gKw0KPiA+ICt1bmV2YWx1
YXRlZFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICtleGFtcGxlczoNCj4gPiArICAtIHwN
Cj4gPiArICAgIGkyYyB7DQo+ID4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ID4g
KyAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQo+ID4gKw0KPiA+ICsgICAgICAgIHJ0Y190d2k6
IHJ0Y0A2ZiB7DQo+ID4gKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiaXNpbCxpc2wxMjA4IjsN
Cj4gPiArICAgICAgICAgICAgcmVnID0gPDB4NmY+Ow0KPiA+ICsgICAgICAgIH07DQo+ID4gKyAg
ICB9Ow0KPiANCj4gSSBhZ3JlZSB3aXRoIEdlZXJ0J3Mgb3JpZ2luYWwgY29tbWVudCBhYm91dCBz
d2l0Y2hpbmcgZnJvbSB0aGUgbW9zdCBjb21wbGV4DQo+IHRvIHRoZSBzaW1wbGVzdCBleGFtcGxl
LiAgSXQncyBiZXR0ZXIgdG8gc2hvdyBhcyBtdWNoIGFzIHBvc3NpYmxlLg0KPiANCj4gSWYgaXQn
cyBub3QgcG9zc2libGUgdG8gbWFrZSBhIHZhbGlkIGV4YW1wbGUgdGhhdCBzaG93cyBpbnRlcnJ1
cHRzIGFuZCBldmRldA0KPiBwdWxsIGVuYWJsZSwgdGhlbiBkb2Vzbid0IHRoYXQgbWVhbiB0aGUg
YmluZGluZ3MgZG9uJ3Qgd29yaz8NCg0KVGhhdCBpcyB0aGUgbm9ybWFsIHByYWN0aWNlIHJpZ2h0
PyBXaGVuIHRoZXJlIGlzIGEgYm9hcmQgZHRzIHdpdGggY29tcGxleCBjYXNlLA0KSXQgaXMgbm9y
bWFsIHRvIGFkZCB0aGF0IGNhc2UgaW4gZXhhbXBsZSBzZWN0aW9uLg0KDQpJIHN0YXJ0ZWQgd2l0
aCBjb21wbGV4IGNhc2UgYW5kIHRlc3RlZCB0aGUgYmluZGluZ3MuLCBsYXRlciBmb3VuZCB0aGF0
IHRoZXJlIGlzDQpubyBib2FyZCBkdHMgd2l0aCBjb21wbGV4IGNhc2UuIFNvIHN3aXRjaGVkIHRv
IHNpbXBsZSBjYXNlLg0KDQpDaGVlcnMsDQpCaWp1DQoNCg0K

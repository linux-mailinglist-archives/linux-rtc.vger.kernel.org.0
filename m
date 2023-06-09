Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1448729219
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Jun 2023 10:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239935AbjFIICA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Jun 2023 04:02:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239937AbjFIIBr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Jun 2023 04:01:47 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2126.outbound.protection.outlook.com [40.107.114.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B5DEB9;
        Fri,  9 Jun 2023 00:59:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAOOzER7+5fIGaN0xVP4O4pteH/7mfoMlAg9rGL5RfxheEm3o0biMnm9jiLQGvw3yQsmG4u8FA73hJPY7Io0waBp/0VcWtkL6ZDv+mM4KJkNiw9BDg/9/sVRymsbzJXTZfwGJKfdFjRI7u46xfrQF2WchagYSm8uf+qyfjWrFlMNV0OUfeXhD2D44Dmeo2MKhuu5UTaUDzEo88AKSG/tdfiewelMws6ECpbcsdlDFuJJJycW/I8r6tSnXo0TJIJCxCx3FrDqVNprafIe4RUCh1vI4KMidq9iK/vFdCW30313AVZLRTGEUf95e/J9fW4dVz/8HceHfedbzVEisVts1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vm3tN6XN/JFrgYbzq0UgkX/90MktjkLv+K22S0hb2T8=;
 b=bwNmarUx+3KbWBr51uyvMWCF0yz5hg0lDI9SAshzIWN2ih3TdnOk5EX4u8qj8O/7a2q0YDmnNb44CdgB4Y/5BeOPDm7nyxg4awtVzFGBQbgeAMowvhpDM06W3w4oxJMKKvbObY8ZXq8YRRkLB+QsW3ABgxez4K6/RnBRVK1stL6v4qzJBQjQHNAGy4txvzxkJ5Ue1nuqDukoZQG8JlPIFqCBAWmPE5r1bzqbANE525MTyv1Y/bKDNzr1DqL4Sfa90n1iVOKJv3GUg0hUWMZDoYysEbG1+raATNsVbH0afdxUuD3KmYCwKDVIC3Coz39KZBrNBova6tUPwIvLb5yY4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vm3tN6XN/JFrgYbzq0UgkX/90MktjkLv+K22S0hb2T8=;
 b=w1hkAgDqZvfRxdcMhGmAOqFcjR9s5LvzxeqYrRuhraCqJFZsKMCtGyZ8b/SPE8XNjygvb7UHEs8RxzSROSnMDaKbABVRstiDq30Uy4atbR02xd7Ed2ofFW9+KyeJWU3aE55bD9oSPPOLl/CUGkcv0RDdPTNt2qsPs067PyIEFA4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB6116.jpnprd01.prod.outlook.com (2603:1096:604:c8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Fri, 9 Jun
 2023 07:58:56 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.039; Fri, 9 Jun 2023
 07:58:56 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Trent Piepho <tpiepho@gmail.com>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH v6 05/11] dt-bindings: rtc: isl1208: Convert to
 json-schema
Thread-Topic: [PATCH v6 05/11] dt-bindings: rtc: isl1208: Convert to
 json-schema
Thread-Index: AQHZlV4COEgAQ7BuwUq6F3eJWMakja+CIs6AgAAAhVA=
Date:   Fri, 9 Jun 2023 07:58:56 +0000
Message-ID: <OS0PR01MB592260AFEB254436AB6200238651A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230602142426.438375-1-biju.das.jz@bp.renesas.com>
 <20230602142426.438375-6-biju.das.jz@bp.renesas.com>
 <CA+7tXijvF=TztybJ=ptUHvBJpENX1foY=Fa_YYrbHd5k-_K_Cw@mail.gmail.com>
In-Reply-To: <CA+7tXijvF=TztybJ=ptUHvBJpENX1foY=Fa_YYrbHd5k-_K_Cw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS0PR01MB6116:EE_
x-ms-office365-filtering-correlation-id: c26f9e79-7081-47d2-798f-08db68bf604f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z8Wn6niQZOAtntK0FcaZtpB6Na1O8DYKMi0BdabUMfK15IYy+3mCDmyo6mCN9xvqubpdojdReMdQwgWFctXj50gYbaDWT8e9h3cDG8Ci4WeuMXj5fzKc/+Y/8oV4I2u8jhoX3Eae5fIqkoQs9stdHB/6p3dk8GIADmCaWBUqF/MbxAmIQbO8h3qBdYopaFMKi8dmZUb2kRDvNFXX5iV+KbjqvaVP02M1G+X+g04RUOtrQAb+m9i8JfojAfk29eEQO1EVwbB220xkmzeFvXZ3i+89pg+gUbmZ6SMOruOUKb8uk/vH/0F/3jtt87H4H1fKfUR0fmPUlMR881NdpeK4m0cTpQ+kh9E21NSo4u2IzzwB/Zm6GwFB1XFQiG9Nq8Nq6ueM0TLgVID3DZG6tBFcV/d9m2yArT5Nu1i8YCqqvwEMD/TKx9ADlKAL0PzRXHCGvI527rj9ykRTeW+qdqW6QA4Xjipq0NWf/s/+YZNpGYIdn5O3eeeFBwO1sclaJnJxfQnAMfboS+WKXFZOnkE/HJRweb9NFB7EuZFNLPYmqOohwKMD16jgLMC7qAN76t9ze0/UnEZ6RkQ1c1Mzzr+D/zoXBK6oJSiViVtS3d1j9SI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(366004)(376002)(451199021)(76116006)(66946007)(8676002)(5660300002)(52536014)(8936002)(71200400001)(66556008)(64756008)(66446008)(6916009)(4326008)(66476007)(54906003)(478600001)(41300700001)(7696005)(966005)(316002)(38100700002)(55016003)(122000001)(26005)(53546011)(186003)(6506007)(38070700005)(7416002)(83380400001)(86362001)(9686003)(33656002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zk5LSlhUYzlDcmRKSVFUdXhmbzdsKzAzNmJhNEJDWnppc2JLdUZKMXRWQ1FJ?=
 =?utf-8?B?Y2VPNVQ2MjM5Yk9DbWR5QW9TcjNTT0srWndmWkMxM1NYU01ON0tCNkdlc0dB?=
 =?utf-8?B?aGZmM0U2dEF1KzZ6SE9WQ3VKY3ExakwzQ2ZJWWdaRENrQlJqMUJMVXI3MnZR?=
 =?utf-8?B?MTVnL2pOMG9Ecmw4QTNJVCtLVlhHMEgrMWY4anMwd2pHL3AzTHdobVAveDBz?=
 =?utf-8?B?eFlVRDUra09jTi9vUDcrMHVMbS9vT2hSS3YxRUl2UE9KdHl3RFQ2aHdwc1ZY?=
 =?utf-8?B?ME5kMU5rNkQwcjJEOHIvSVFnOVh0a3NzYWxOOHpWN0IydDY3VXIxMTd4T3A5?=
 =?utf-8?B?ejkreExzMkNvUlgyL05UVjdHamNSSzR1OXUzWlVuTnM1VUJMRnJRSlVCdUNw?=
 =?utf-8?B?K2tpc2ppNDNBdFVMbUFVVlVmRkFQbkg4QlRSMVhSenc5OXlMTS8vcHZjV3o3?=
 =?utf-8?B?cXRXL1pqWGVSczlaWFZoRVdXTm5MWTYxS05uV00wakdxQVc2a2tOTVByVWgw?=
 =?utf-8?B?d2phclE1UjV0YldrNVUzeVc5eDNXWG9YUDhIZ2FQQVdhNU14a0pLZkZ5eWt1?=
 =?utf-8?B?OGowTDluVEZzNGlLNXRnZUlwc0NMTXQwbm5JUUdzSUREc1N1bzJmbm0xL3lZ?=
 =?utf-8?B?UnVWMjVDN1ZHQkVUMzJjckJLTjFQemtsT1dEZGVXZy91cVhHWnNuV1cvb2tL?=
 =?utf-8?B?VlN0YUhjM1JqUzljTCtadHIvdW1XclNWWnhJallTOWpMajFIYkl0SlZCZW9o?=
 =?utf-8?B?NTRPSGRkaHpJNlA2SjcySkR0YmdCOTlZZkVqYjdDS3dnMjVvQlpRWHRzSGlV?=
 =?utf-8?B?eWptT2E1ai91ZDRTTHpqUXZUV2YzQVlDd3k5Q2RMdjY2YWRzaW84RVkvS1cx?=
 =?utf-8?B?N0pTMHRrSnZQL0ZQNTloNVdSdFNQejU3Q0k0YTZpY2pjeDJoRHRyRElBMkQ3?=
 =?utf-8?B?OU0rMWpiN29qUDRtR1hBUWd4OG95MjZqR2wyRmhBZXJETmxJdlJHa0ROSllr?=
 =?utf-8?B?ZXFNNDdZbzZvZUY5VmtHUTVoYnN2ZFJuQ2l0TlVLY29RbkhLbGw0NDQ1MWZn?=
 =?utf-8?B?aEEvVHQ1bWg2cS9ha1RCZ2Q5TWQ5UzFwcjhJdEszKzA3U2xtT3Y4andKQ0JH?=
 =?utf-8?B?cmlqem9HTld2cjdQNUtYc0hVS2V5aEowQkFUNzVHUnBLeGUrYldCcHpsTWc3?=
 =?utf-8?B?KzhoRmJ5aFpDcmFmbXUxWE5XZzRRVEZaS1hWcGZHWFc1S3hCM1BYTEdoNk9n?=
 =?utf-8?B?LzJQWHU4VXk4d0pjekorbnd2VTBOdTRSQ3dDQ2JUZzIvbGRTcndUdkQ0SzZW?=
 =?utf-8?B?SWkvWktTYWxvREt1ckd2bGVuTXUwQlVHYzdIZXdIMCswM3dLR2U5emg0QldU?=
 =?utf-8?B?MFp3L1J1SGE4Q3VDQVBIUGFPUUQ4MW1LVDY4NTdYaEFhbE5CMytpSkVQSEdV?=
 =?utf-8?B?bWM4d3B0c1UySU92ekxrc1JGS1AxTlM1cnBIak9tSnR4QWk5ejYzQVpVeWVn?=
 =?utf-8?B?bDBuMnJmV09OSFZtUVJMcHlLNjJ1YnB0Y2xFMmNkakVuUjAvM29JcGlaeVk2?=
 =?utf-8?B?MzdqMG13ZEwreFB1YkRPbklRR2tacTV3eWxtM3hLTm9hbWpmeDVIWmszOU9T?=
 =?utf-8?B?b3A4Uy9NWVllNFpReHdZOGwyUmUxZWxpVWM0b2E2Yld0VExTNHp0UC9sNXhV?=
 =?utf-8?B?emRSaUtsOEV6czZUbUZwSW1Bc1d4Ymxnd3dKVStXZXNOalp2bU5MY2prR0pr?=
 =?utf-8?B?aStHbG5WTU1RbUp6SU1qY1QzYWlwTUtnZG9zMTJaRHIxcU1VN2pPM1pUblA5?=
 =?utf-8?B?Y1FDWnhac1RkUTRodDlRYnRjdW1ZcStRZmFKQVkrYkpEZEdSR1NoT2lNT2ZT?=
 =?utf-8?B?K2gwUzJzMkhhZEF6UTNJaDJFblBSZWdoSnFlOVdhaW9oaHRWL1RmNzZRN0Zu?=
 =?utf-8?B?Sk0yeGJsMEFNQXdsM040cnFFU1FwYXphSkFjZWVIVmxTSTJ0em5yQ0t0dVlq?=
 =?utf-8?B?RlVjRzZZZ293NUZaQjF1cEtyNUREbnJ0bDBiK0dIZkhWbEtwNEtPcmplaVhD?=
 =?utf-8?B?TGgvWUtrcTZja0lJaE8rSkVJZ1ZYdDM1YnpjL0plemhTc3RnWnpqR0M5KzFJ?=
 =?utf-8?Q?FsuMEdf11Np1zR2kd7FWN9/or?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c26f9e79-7081-47d2-798f-08db68bf604f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2023 07:58:56.6881
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VDPumgJkWVKbnpWDdbAdjhec4LEjZwVtUH+dF5MPmG1IgzdkOWUqJ2ZvPy6B5mB2Qm5g5aFuevXEE8Uf9AxieePBWR6tvtpustbQfUlBtmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6116
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

DQpIaSBUcmVudCBQaWVwaG8sDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjYgMDUvMTFdIGR0LWJpbmRpbmdzOiBydGM6IGlzbDEyMDg6IENvbnZl
cnQgdG8ganNvbi0NCj4gc2NoZW1hDQo+IA0KPiBPbiBGcmksIEp1biAyLCAyMDIzIGF0IDc6MjTi
gK9BTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+
DQo+ID4gQ29udmVydCB0aGUgaXNsMTIwOCBSVEMgZGV2aWNlIHRyZWUgYmluZGluZyBkb2N1bWVu
dGF0aW9uIHRvIGpzb24tDQo+IHNjaGVtYS4NCj4gPg0KPiA+IFVwZGF0ZSB0aGUgZXhhbXBsZSB0
byBtYXRjaCByZWFsaXR5Lg0KPiANCj4gSSBzdGlsbCBkb24ndCBrbm93IHdoeSB5b3Ugc2F5IHRo
aXMgYW5kIGNoYW5nZWQgdGhlIGV4YW1wbGUgdG8gYmUgYXMNCj4gc2ltcGxlIGFzIHBvc3NpYmxl
Lg0KPiANCj4gRGlkIHlvdSB0ZXN0IGl0IGFuZCBkb2VzIGl0IG5vdCB3b3JrIHdpdGggdGhlIGFj
dHVhbCBkcml2ZXI/ICBJIGxvb2tlZCBhdA0KPiB0aGUgY29kZSBmb3IgcGFyc2luZyBPRiBpbnRl
cnJ1cHRzIGFuZCBpdCBkb2VzIG5vdCBsb29rIGxpa2UgYW55dGhpbmcgaGFzDQo+IGNoYW5nZWQg
dG8gbWFrZSBpdCBub3Qgd29yay4gIE5vciBkbyBJIHNlZSBhbnl0aGluZyBpbmNvcnJlY3QgaW4g
dGhlDQo+IG9yaWdpbmFsIGV4YW1wbGUuICBDYW4geW91IGV4cGxhaW4gd2hhdCB5b3UgdGhpbmsg
aXMgd3Jvbmcgd2l0aCB0aGUNCj4gb3JpZ2luYWwgZXhhbXBsZT8NCg0KVGhlcmUgaXMgbm90aGlu
ZyB3cm9uZyB3aXRoIGV4YW1wbGUuIFRoZSBvbmx5IHJlYXNvbiBpcyB0aGVyZSBpcyBubyBkdHMg
aW4gbWFpbmxpbmUNCm1hdGNoaW5nIHdpdGggZXhhbXBsZS4NCg0KSWYgSSBhbSBjb3JyZWN0LCBl
eGFtcGxlIHNob3VsZCBtYXRjaCB3aXRoIHJlYWxpdHkuIElmIGl0IGlzIG5vdCB0aGUgY2FzZSwg
SSBhbSBoYXBweSB0bw0KdXBkYXRlIHRoZSBleGFtcGxlLg0KDQpJIGhhdmUgc2VlbiBwZW9wbGUo
aW5jbHVkaW5nIG1lKSBzZW5kaW5nIHBhdGNoZXMgdG8gdXBkYXRlIGV4YW1wbGUgd2l0aCByZWFs
aXR5Lg0KDQpOb3RlOg0KQ2FuIHlvdSBwbGVhc2UgY29uZmlybSBydGN0ZXN0WzFdIGlzIHBhc3Np
bmcgd2l0aCBpbnRlcnJ1cHRzIGluIHlvdXIgZW52aXJvbm1lbnQ/DQoNCkluIG15IGJvYXJkIGlu
dGVycnVwdCBpcyBub3QgcG9wdWxhdGVkLiBTbyBpdCBpcyBnb29kIHRvIGtub3cgUlRDIHRlc3Qg
d2hpY2ggaW52b2x2ZXMNCklSUSBpcyBwYXNzaW5nIGluIHlvdXIgZW52aXJvbm1lbnQuDQoNClsx
XSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xp
bnV4LW5leHQuZ2l0L3RyZWUvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcnRjL3J0Y3Rlc3QuYz9o
PW5leHQtMjAyMzA2MDkNCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiA+ICsNCj4gPiArICAgICAg
ICBydGNfdHdpOiBydGNANmYgew0KPiA+ICsgICAgICAgICAgICBjb21wYXRpYmxlID0gImlzaWws
aXNsMTIwOCI7DQo+ID4gKyAgICAgICAgICAgIHJlZyA9IDwweDZmPjsNCj4gPiArICAgICAgICB9
Ow0KPiA+ICsgICAgfTsNCj4gPiAtLQ0KPiA+IDIuMjUuMQ0KPiA+DQo=

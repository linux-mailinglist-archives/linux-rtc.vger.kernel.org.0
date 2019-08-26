Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3B89CD69
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2019 12:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730188AbfHZKkm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 26 Aug 2019 06:40:42 -0400
Received: from mail-eopbgr40079.outbound.protection.outlook.com ([40.107.4.79]:58850
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730116AbfHZKkm (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 26 Aug 2019 06:40:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvrEVZfCBRDbKO/Z0T5Qe2NZhJoGwStxfu7cZcF2PBg6GuSNsqiNbpAUe6YsG9dxocFuH1VfSsPXK9LNJAjbXqE6lPfPccALTqsrKvvkBfwmSotvTyZZHle900DNtsaMebsd8NdTxzyWgsj8U40knLtVpjJSI3Bs1Bap5ztmYgpeH60jZOLP21TNUKMDJmroC8gPOC7EmQx2hskeOlCx+TtA8mq6h2fhHgC5oWHndkWLVzfFuB0uhWffFGW14bxdZyEA2sCN7DaG/x1PH23/aX+X4QiGQ6RoHeJ9pv9pa1dQxFE5Tf0Y3op4RFaTZldftVerWiFKN0sW11NjORfeig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jr5rLjXnThuqs8TZ5t84q3H2HcsJavQ6gNXvXg+X+uE=;
 b=eMJeL1wLvlVI1StXoYMcA+6+Ux+K765CQIGgmwiz4envKIb2DZZkaYeZqxCpBMWNaG/yLTSJvo8wkDdoKzXtP2GkE8BnVpfGAqpJROmzteoFzJUv6sMlaQ+Ld5vUYszHX8unAE+SaslgU7MaeM9YTR5kc6h7KVCEefikHK56EgP+4JpJa5XVykk6XZ1uCjMODEPn6Jrqzm8k0uUU5/ai++1mBJ9DNqcHj//VfNEjeVPExZElS5f360pYSbNesEBxcySeOPxOHq2uDqx0+ZP3cJ0P3u63esmpgur7XyPWaGFejTLqzCI/AC4eMDj4Go2pFPKW9e2dX6ok/wZJTYpafg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jr5rLjXnThuqs8TZ5t84q3H2HcsJavQ6gNXvXg+X+uE=;
 b=SMzCt2WlD6nCAkF9IAcUU3cTlydoAKWlwq6tpooqRBGQT1xrbryMvBpZZSWS+FOSa3taQIQKtXRC3O8ymDXdCtfKCazZnHk48mNgY3eUwRc2kZuTxR0RN+X23saQpAx1lPDZn6vXLIt7rDeZUekGx9wD8kOKVb4mxbCHHETiyWc=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4780.eurprd04.prod.outlook.com (20.176.235.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 10:40:37 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::3cd8:4bcf:8626:4254]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::3cd8:4bcf:8626:4254%3]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 10:40:37 +0000
From:   Biwen Li <biwen.li@nxp.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Nandor Han <nandor.han@vaisala.com>, Leo Li <leoyang.li@nxp.com>,
        Mark Brown <broonie@kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: RE: [EXT] Re: [v2] rtc: pcf85363/pcf85263: fix error that failed to
 run hwclock -w
Thread-Topic: [EXT] Re: [v2] rtc: pcf85363/pcf85263: fix error that failed to
 run hwclock -w
Thread-Index: AQHVU944/chRI20GGkSPTXSrUh+lT6b9aqqAgACCWYCAAAqBgIAANb+AgAb78oCAB7jGEIAAVF2AgAAIeTCAAAVmAIAACJGw
Date:   Mon, 26 Aug 2019 10:40:37 +0000
Message-ID: <DB7PR04MB4490A1949E964EAD1F539F2E8FA10@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190816024636.34738-1-biwen.li@nxp.com>
 <20190816080417.GB3545@piout.net>
 <CADRPPNRkqbWzGEvUJyi0Qff3oS6biO0v7BTrK1Jiz9AMnOYF=Q@mail.gmail.com>
 <20190816162825.GE3545@piout.net>
 <CADRPPNQwcGrVXLm8eHbXKmyecMhT6Mt9rNGnspJA1+MnV4K8oQ@mail.gmail.com>
 <ff198737-acb5-7186-7e14-a1e1cdc0f72c@vaisala.com>
 <DB7PR04MB4490614205732E4508B8A8B38FA10@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <21f417e3-db50-5930-ddc9-eed54f5d5893@vaisala.com>
 <DB7PR04MB449081DBB762BB30E2C55F638FA10@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <20190826100650.GB21713@piout.net>
In-Reply-To: <20190826100650.GB21713@piout.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6f407a2-23e1-4c14-7ab4-08d72a11d500
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR04MB4780;
x-ms-traffictypediagnostic: DB7PR04MB4780:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB47809F8A7928CC033B1632FC8FA10@DB7PR04MB4780.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:431;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(199004)(189003)(186003)(53546011)(26005)(6506007)(8936002)(446003)(102836004)(3846002)(6116002)(5660300002)(52536014)(476003)(81156014)(8676002)(81166006)(11346002)(44832011)(486006)(25786009)(4326008)(6306002)(14454004)(14444005)(256004)(86362001)(71200400001)(55016002)(45080400002)(53936002)(6246003)(966005)(9686003)(71190400001)(478600001)(6436002)(54906003)(316002)(6916009)(64756008)(66946007)(74316002)(66476007)(305945005)(66556008)(66446008)(76116006)(99286004)(66066001)(7696005)(7736002)(229853002)(33656002)(2906002)(76176011);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB4780;H:DB7PR04MB4490.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hDqp3AgFwY0SA58lowQFV1NBaRMIprN82IeGkaXVJxWIad3gqVtJPPFb0bN35g3BFY8ZAcGD3tcDAhD5B81eJOY7tkBZ0zl1GU6mTiGOKcCcwXRAOG0LrOUqNQJr2BXmw7mgBuEQ/tsGH2ySUUfeSIc4ZmAyKTLosBBjFGwGKZ86rfFuXgRG9CcIhsDHKoYnsUjJ6+bjOgNXRuj/++EyRME0jH8LQ6mmvSQKVeDFH+CDD35/71jj2vndnj8ywBEI0+5vxBuTFsgEZrVDpZRQPhQSn+YW6EKuw4k/1ArikqnernPz1CVsFlNntHvbTGzhbM7PMTP4hdNmKOEwe73ss+gXgx8whEp21roIe3abhEKUTgG2hZTGO5J7pTgc00o3ln7LimKM2z/5Vk7Yj+GbQITuegK91Rrwco78PFLwKM8=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6f407a2-23e1-4c14-7ab4-08d72a11d500
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 10:40:37.1744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c0dQ4Bs8JIC9PG0wJu/zm/67qFbg+6OnkKBJ4rScDp7dRpBpV32lCR/9iQMLPG70jgkiTHN0567V3A3QKpvifQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4780
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

>=20
> Hi,
>=20
> On 26/08/2019 09:49:49+0000, Biwen Li wrote:
> > >
> > > On 8/26/19 7:29 AM, Biwen Li wrote:
> > > >>
> > > >> On 8/16/19 10:40 PM, Li Yang wrote:
> > > >>> On Fri, Aug 16, 2019 at 11:30 AM Alexandre Belloni
> > > >>> <alexandre.belloni@bootlin.com> wrote:
> > > >>>>
> > > >>>> On 16/08/2019 10:50:49-0500, Li Yang wrote:
> > > >>>>> On Fri, Aug 16, 2019 at 3:05 AM Alexandre Belloni
> > > >>>>> <alexandre.belloni@bootlin.com> wrote:
> > > >>>>>>
> > > >>>>>> On 16/08/2019 10:46:36+0800, Biwen Li wrote:
> > > >>>>>>> Issue:
> > > >>>>>>>       - # hwclock -w
> > > >>>>>>>         hwclock: RTC_SET_TIME: Invalid argument
> > > >>>>>>>
> > > >>>>>>> Why:
> > > >>>>>>>       - Relative patch:
> > > >> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2
> > > >>
> Flkml.org&amp;data=3D02%7C01%7Cbiwen.li%40nxp.com%7C03141ff7858343
> 3
> > > >>
> 20be408d72a0d1e10%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%
> 7C63
> > > >>
> 7024108138794294&amp;sdata=3DQrALkFN6heF%2B7S73FQ9c%2FyKNRHyBuL
> %2B6
> > > >> %2B4PDM9hYRyM%3D&amp;reserved=3D0
> > > >> %2Flkml%2F2019%2F4%2F3%2F55&amp;data=3D02%7C01%7Cbiwen.li%
> 40n
> > > xp.
> > > >>
> > >
> com%7Cff8cebc3f1034ae3fa9608d725ff9e5e%7C686ea1d3bc2b4c6fa92cd99
> > > >>
> > >
> c5c301635%7C0%7C0%7C637019652111923736&amp;sdata=3DspY6e22YOkOF
> > > >>
> 3%2BF7crSM0M6xPmOhgULDqMZLQw%2BAmdI%3D&amp;reserved=3D0 ,
> > > this patch
> > > >>>>>>>         will always check for unwritable registers, it will c=
ompare
> reg
> > > >>>>>>>         with max_register in regmap_writeable.
> > > >>>>>>>
> > > >>>>>>>       - In drivers/rtc/rtc-pcf85363.c, CTRL_STOP_EN is 0x2e,
> > > >>>>>>> but
> > > >> DT_100THS
> > > >>>>>>>         is 0, max_regiter is 0x2f, then reg will be equal to =
0x30,
> > > >>>>>>>         '0x30 < 0x2f' is false,so regmap_writeable will retur=
n
> false.
> > > >>>>>>>
> > > >>>>>>>       - Root cause: the buf[] was written to a wrong place in=
 the
> file
> > > >>>>>>>         drivers/rtc/rtc-pcf85363.c
> > > >>>>>>>
> > > >>>>>>
> > > >>>>>> This is not true, the RTC wraps the register accesses
> > > >>>>>> properly and this
> > > >>>>>
> > > >>>>> This performance hack probably deserve some explanation in the
> > > >>>>> code comment.  :)
> > > >>>>>
> > > >>>>>> is probably something that should be handled by regmap_writabl=
e.
> > > >>>>>
> > > >>>>> The address wrapping is specific to this RTC chip.  Is it also
> > > >>>>> commonly used by other I2C devices?  I'm not sure if
> > > >>>>> regmap_writable should handle the wrapping case if it is too sp=
ecial.
> > > >>>>>
> > > >>>>
> > > >>>> Most of the i2c RTCs do address wrapping which is sometimes the
> > > >>>> only way to properly set the time.
> > > >>>
> > > >>> Adding Mark and Nandor to the loop.
> > > >>>
> > > >>> Regards,
> > > >>> Leo
> > > >>>
> > > >>
> > > >> Hi,
> > > >>     `regmap` provides couple of ways to validate the registers:
> > > >> max_register, callback function and write table. All of these are
> > > >> optional, so it gives you the freedom to customize it as needed.
> > > >>
> > > >> In this situation probably you could:
> > > >>     1. Avoid using the wrapping feature of pcf85363 (you can just
> > > >> provide separate calls for stop, reset and time confguration). In
> > > >> this way the `max_register` validation method will work fine.
> > > > Yes, I use this way. Path as follows:
> > > > Stop and reset - > set time > stop
> > > >
> > >
> > > Some of the concerns regarding this method was that it might not be
> > > precise enough. That because you need 2 I2C operations (one for stop
> > > and one for time configuration). Not sure about your case if this is =
a problem
> or not.
> > Ok, got it, thanks.
>=20
> To be clear, for this RTC it is fine to separate both writes. Want I want=
 is a
> corrected commit message with a proper reference to
> 8b9f9d4dc511309918c4f6793bae7387c0c638af instead of a link to lkml.org
> and a proper explanation.
Ok, got it, thanks.I will replace link to lkml.org with
8b9f9d4dc511309918c4f6793bae7387c0c638af and add a proper explanation
to the commit message in v4.
>=20
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootl=
in.
> com&amp;data=3D02%7C01%7Cbiwen.li%40nxp.com%7C03141ff7858343320b
> e408d72a0d1e10%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6
> 37024108138794294&amp;sdata=3DXnAxJmOkh1VVA9ed%2FLr%2BbvWbVpLD
> bwLjJrdaFidRtDk%3D&amp;reserved=3D0

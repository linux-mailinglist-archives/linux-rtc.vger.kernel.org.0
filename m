Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C31D545EC50
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Nov 2021 12:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232706AbhKZLTt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 26 Nov 2021 06:19:49 -0500
Received: from mail-eopbgr150043.outbound.protection.outlook.com ([40.107.15.43]:37607
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233163AbhKZLRs (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 26 Nov 2021 06:17:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8QgS2Y0TOKsDoaK8osed+PbqeJ99dEdN2k75BfLKBSJa9DT0nwER6s+1AtHPk6aNI1f/oDs5dKtiEqDx2swk+1VDgt/J1z7JxVAM2ujvTw1LKqR34lu50LwusylDJz6AKqV7RxB2veaJk54Pw33LtaOJ8B6mfirKyakunwNFF2HNogsZHSXwHuuXeCqc495IR9eCrjvmJ6gJy2SqbFSeWWTxo9dHfTILdJKRFl+6ncv+mL+LHZkTXjpR1deHL4vJncDRxJb7t8HgKlInyRN+LCZfmaT2GodBpTa78wjyNMZYrTpcJMEoAM33OOR98wKdOledhJYrX6s27g7yyo5XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndPL6kLd6QfQZt4KOXJDn2blP7WokA+fFhp7kwKi4rc=;
 b=FUd7z+W+Jj2FYlus9kMk8F2XOiVo6w0Jyk0HqYEzho0O1l7WHLL1tYK08SwbpnTbEr5Zhh8oqMyjXuRmbSN57ggKYPER4svn82//cn+0Upqr8ZxEx56ohbLtMsxauSi7pxxWVxT7+hVQ7X5T+rx2+FhpGxQWS2hPKumCkASPIUCabdZvLjKNVDDCK6xfICT9jZK5oCo7oIw6OJpYheVr35j4mpBdlHwrOSEde61PyW6IMBmf7Zhav+H5vhnSM5pKwqGkpfJpx+870+LSGMFhGOPkXGjglfeRxBsz51SIlOI+zYTXUbP63ylXDS0E+x5XEqNaKSFL0M8HGkI7aEDtkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndPL6kLd6QfQZt4KOXJDn2blP7WokA+fFhp7kwKi4rc=;
 b=0fuBfJ9O+YKhQnyjjhFnQYM+BYjC9EYGFeisqxHADmWrKQbF/uRY9ThwNgFWcpyeLNQyLIl3dTh4xUzHexaHQIrQWKrRk5+DMl9fZttpKtwL4oNIMv7FFQptxPE97/7Hbl4HHaFaY2CFOgYXrxY6dCjU8gS9DhehLYstoSrAECI=
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:255::23)
 by DB9PR10MB4683.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:250::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Fri, 26 Nov
 2021 11:14:32 +0000
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::852d:c54f:8414:3276]) by DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::852d:c54f:8414:3276%3]) with mapi id 15.20.4734.020; Fri, 26 Nov 2021
 11:14:32 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Nikita Shubin <nikita.shubin@maquefel.me>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
CC:     David Abdurachmanov <david.abdurachmanov@sifive.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] rtc: da9063: add as wakeup source
Thread-Topic: [PATCH v2] rtc: da9063: add as wakeup source
Thread-Index: AQHX4HNzUIS5EGphikWduNMlpOwuLawRLClQgARdmYCAAAoNYIAACoAAgAAOSTA=
Date:   Fri, 26 Nov 2021 11:14:32 +0000
Message-ID: <DB9PR10MB46522773A37F67052B6BECE180639@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
References: <20211123140604.21655-1-nikita.shubin@maquefel.me>
        <DB9PR10MB465224854946DABA0F75515980609@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
        <20211126120935.188e672a@redslave.neermore.group>
        <DB9PR10MB465287595152C33A43FDBCDA80639@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <20211126132308.7b265f17@redslave.neermore.group>
In-Reply-To: <20211126132308.7b265f17@redslave.neermore.group>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aeadbef6-0f75-41fd-b01e-08d9b0cdec07
x-ms-traffictypediagnostic: DB9PR10MB4683:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-microsoft-antispam-prvs: <DB9PR10MB46837DFCFF610BC5F4F9A93DA7639@DB9PR10MB4683.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: plAJ20N/ig+S6UA8l2uAi056OVobt2B3CQtAh5txqVqcki0/Mb/2LcOyaBsgvgGM2BARBmaQNKXHCr8S773/8fn/5CWYQekTZk8ja+FZfeK40yJ24bKOMq80mYWmriE4OSi6ZsyluMdRKlBWV8T5dAOCsuU5jiWc8hTlXrdOCs7SujvrfVsUJ6g/INg4XbXr2nnr7YaCOzABzt+oWMwzmEgh6j5YhntJX3crwxlRjVLnlUU50TKgybw1YpJwEY+hBymWhajkJSqkEtbWmBITjnGENI/g6DJ/xKGw5UovV/I5HxqXozneQkyR0h54SzqznoD8yzP2dOVjLT4X70OrIg4pqZhJrrmMqfWfB3XfC4cQ1pg9+m9g36FXqMn3qUu35P265pxRSckn2yNntuckpaYbuLPe1vfWTO3rcVR9DRxIHg3YB37UweMQQnp3Rt9PvpKYQo6O+wH02LpHhHtNB7vxrY+cqJ5E7zqFisew4PIaVq52d2f77dcGx+7w4Kg++QBG8wv5jU0LVWcMh66aYC2pcc5VVaAoLbPXUBGYvdcGJ8b/GAWxtSt/dT1ct6BoVGsM3fNyMsFyteNYXecksT2MGNIZ/GVFUnhKOGKN0RmczHYn7mPH+MYu2dq1WWqqLskkZfwQSzmiQZjARihZBfEozuyWEc0ufQi1ibuDgFJC5fd5rVP37aRItUGSPBi0e4w4iLMiVOrVBHF6mmyqJw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(2906002)(66476007)(122000001)(33656002)(55236004)(71200400001)(8936002)(38100700002)(508600001)(53546011)(66556008)(55016003)(83380400001)(38070700005)(7696005)(8676002)(9686003)(86362001)(54906003)(76116006)(66946007)(66446008)(52536014)(6506007)(26005)(64756008)(316002)(5660300002)(4326008)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JAQTQo1NVouedsUJoRQqjxrBlBvtfYtGwx0/Sf1th0JCFryfoFmIamZwXWqI?=
 =?us-ascii?Q?sj5njTXSEJ7fAlrJ1RR7niUZJJu/OFhkZYksf2T+JLL0fgO728ywoYSQJ5k9?=
 =?us-ascii?Q?RFOHgGCV2z2dkixu3Cyij3sdfq0LHE+MFekiQGHDe7dHnJZfwlphjtWrThtG?=
 =?us-ascii?Q?sgf42hzUqxFfev1qvICC/ttrAxkjmz06S4DGrwM43CH62f5osmrRUBR/lyUA?=
 =?us-ascii?Q?TFA71n5l7ApT8ISAknboqKZDmoGjaICUzMXWeicSHyfdq8VwuQ/ltwYgK7zm?=
 =?us-ascii?Q?EodGPGhCF7g0Im8o1rHhzPXrv6acyNdCbGBtz30fSPCSj6NeWPQEBRZ8bXco?=
 =?us-ascii?Q?RR7aGAJKFv6TXKjkPFudZER77Pmy9X8HiR/tjwWnZ8o1woGRyc46FX/u1ue/?=
 =?us-ascii?Q?t+ncGp+gDTEO8dD5QbBBXUWmzabWHaRXH+eKbpvqNDAk8GPZ+cTbS9PGFlER?=
 =?us-ascii?Q?z+G4XVwb9omIEhXhGduxS55a0et/RLEer9XpkTBtVHzm+1E+IBQCAFbYbJyU?=
 =?us-ascii?Q?mQSnCDoKeyT61+NHi05y/9qLhDZ+jewu8Ul06uhe5SKgJ0FBJhzagYOwv5in?=
 =?us-ascii?Q?VCIxrvbsQxEXPpbDxCgDr7MR9xQA4jYD7vVs/PWlANQIDBGUd0IqEzVwMbM8?=
 =?us-ascii?Q?04SRgwfS5cUPgAwN1hBfMJyUrE+FEE0lQXcWdeEOELaNBA9V1uSLKSiWpyhi?=
 =?us-ascii?Q?A52qPayhMFdH6edEkLOkUTDyuahVFmNO2KERZ8pjx+m7A9o8u19Sgy72yNRP?=
 =?us-ascii?Q?0BTrSuMrr39jCBtLbQ0sOe1jWjtI79EEEidLHXdjv9IrLFGlbb6R2d0esLzX?=
 =?us-ascii?Q?xrLxLgrykvLNFztArxzT1vzbOs1JsCzXw5jH7u2okjwQlqC7fZSlfCQ7OfZW?=
 =?us-ascii?Q?YWQauesrVAV0RzfL4DtkA+w6Eyo6vG0GTIQbpI0C8luVjJFqjEa6P8coW5nW?=
 =?us-ascii?Q?+p1P5fNGSbuT0oSnFFf28WPQicLaS81tCFZOVld2/QlWDO3yushnRbnwPUvB?=
 =?us-ascii?Q?Bj95jsZXrD4O5IjUUgpJPILviH36b2mc812m5537alNaP52mY3GPb3bXplgi?=
 =?us-ascii?Q?F3abiR8zMyUn1NX6mvri6qnC9XHGCeIuVZaLibG7M3nTDIAC9TJvTYu0/8GZ?=
 =?us-ascii?Q?ZOU1kpRmVoYbaUhTquRtuIH1ad2cG3zdLc8FYOoKDfidttplfO+pO2NCptWG?=
 =?us-ascii?Q?ONaaXCS63EWLyhVKhaL0E1KnBoQzYdg97GPY6cuq64RuToEzPFqcIbYPDtws?=
 =?us-ascii?Q?aqHfGpwEhUlmtDDkD9BHapNr54OnnR2e0HA+RRRLb4fGIHu1zqrxo6EKdPE0?=
 =?us-ascii?Q?GA8J2ql6OsrNBCw0t6G1xjtr33bgbHVfoIw1pDkJHv0f/c/ejYtPLC+4Eusg?=
 =?us-ascii?Q?xMKQwCN+s9v/Ay/HCNx1oSMeD/koeWPKPZ6qm6HQj2X4foq2BOmxsU3f5h2/?=
 =?us-ascii?Q?iSO/Xb6MHcf6bdTGN+0GbrDl8c6iVeIGPQrluEPRJpkKlAF7nPKa4Hh7dE0r?=
 =?us-ascii?Q?hDE9XoryCWbcPrPP93xkK82knxOPdzlmY135LDBX2qnzkbLuATDLrODOxGRx?=
 =?us-ascii?Q?iB7MLKU7a/CrhevmcPpA/xd3hEmUbHdM+VMmQh78J73MwcGcTReOzhnJ82rC?=
 =?us-ascii?Q?yIgkKaR/mlQ0Pvci4xECo9JRgNghqJZkidET3aRFmRdsp3LTkwYgtINVDDPH?=
 =?us-ascii?Q?Um/64Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: aeadbef6-0f75-41fd-b01e-08d9b0cdec07
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2021 11:14:32.2734
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MJ2w25DBsmjkxJ/5khIMCHq4q2TPn/jsNrc40rf0vDT5KICyc++3YYjIXaVkP37JOtH+RTGQ/QPpUcYW+6wqcBDKASTjiCZVftj5blRVI2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB4683
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 26 November 2021 10:23, Nikita Shubin wrote:

> > Thanks for the detailed response; it helped a lot. Having reviewed
> > the core code along with your description I know understand what's
> > happening here. Basically marking as 'wakeup-source' is simply a
> > means to expose the sysfs attribute to user-space.
> >
> > Yes I think in the commit message you should be clear that there's a
> > need to access the sys attribute 'wakealarm' in the RTC core and
> > clarify exactly why there is that need. Your commit log should be
> > good enough so that if anyone else needs to look at this later they
> > completely understand the intention behind the change.
> >
> > By the way, I assume the functionality you're looking for could also
> > have been achieved through using the /dev/rtcX instance for DA9063?
>=20
> Thank you for pointing this out, indeed i missed that obvious thing.
>=20
> We can also simply set alarm via rtcwake, even if CONFIG_PM is off:
>=20
> rtcwake -m no -s 60
>=20
> Now i am not sure we should make changes to da9063-rtc driver - what do
> you think ?

I think the change is still valid from what I can tell. Just be clear on in=
tent
in the commit log of the patch. :)

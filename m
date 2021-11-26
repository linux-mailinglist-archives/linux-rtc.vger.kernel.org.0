Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A38A45EABF
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Nov 2021 10:52:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245030AbhKZJzi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 26 Nov 2021 04:55:38 -0500
Received: from mail-eopbgr130058.outbound.protection.outlook.com ([40.107.13.58]:29093
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237535AbhKZJxh (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 26 Nov 2021 04:53:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6CwzCsMX9hWw3++cyxIB+7qRlFtH2bE0rBgnBXiF4itG8G1ENUS2iMk/jlPsaXOy40YO3knJt1YVIy2kX0vxY7cIypQ4g3a/usCvVRzAljjYCmAjrhQL20B3cvG8v8/3n5cUkxHtmIQsJ7NohB837mpFsiJVOT6uKYgKd2xKM87fQf/Yr+zip7pT7gdgZN/z5uJGmJ8GhFjnaXk/wilaHBZG+5Eg/QEZc2Kw4ZxGBaJx4FllAkoM/nGNDe/DOVXXQmTwEBkMnDePa4CQ6VeFnnEc3ryQn2N5f4ZbsrnlAH6LaKpZ1WJAYD3ARl83+Tj1lFhR9mISKNeGO8O/sIAZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYoQ2ugbcliUJqzVqL4ipBMBKPL0N9ej+MnTjvjaSzA=;
 b=D6YoCccwDnlD1tNSty7mEWdsX/f5V6Ent+py1zbh4OU3DFuXhVzsJvqVvCZYv7r7GfAP8PbvrvBLM61JLvHiN6z2HU+reSQC4m6SvGwFVq3BKdXE58rn1rD/T7LFtUkqQdG+UPf0sF+BVYac1Mei9t5wFvCSpg1/3MEhgBqa8VZxK9RzMSllTTH4ScCfPmISVTEF7zEl3aepLzNqhlwDN138tlsXtOcVlCPtowT7W3HiMbq4fwXq8TFki+XZ/JBCSjGMxCjM9etXeQlIG3juKhrLVJgtc+VnUu6Y7H2j1PyMFltHj+TzFBoWaZrH+4SM8SbGxlewUEFb5MJqBWAfig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYoQ2ugbcliUJqzVqL4ipBMBKPL0N9ej+MnTjvjaSzA=;
 b=LnLaciH+dy9Zr7mfdxTBKq2G/T4Syg60+bYs78lF7RIWWlmdoXxkW5DOQyNC35UAb+RdGyM0aLuR6mFRH1s+qDqj3d2EBDoL1u5awi25YJcnD8B63W0+LSUEbNnboNujfS/6T9Nk/1Zv7OqURJisaA1v/k4vdha9H3KgqmrfJm8=
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:255::23)
 by DB8PR10MB3129.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:111::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Fri, 26 Nov
 2021 09:50:19 +0000
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::852d:c54f:8414:3276]) by DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::852d:c54f:8414:3276%3]) with mapi id 15.20.4734.020; Fri, 26 Nov 2021
 09:50:19 +0000
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
Thread-Index: AQHX4HNzUIS5EGphikWduNMlpOwuLawRLClQgARdmYCAAAoNYA==
Date:   Fri, 26 Nov 2021 09:50:18 +0000
Message-ID: <DB9PR10MB465287595152C33A43FDBCDA80639@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
References: <20211123140604.21655-1-nikita.shubin@maquefel.me>
        <DB9PR10MB465224854946DABA0F75515980609@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <20211126120935.188e672a@redslave.neermore.group>
In-Reply-To: <20211126120935.188e672a@redslave.neermore.group>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b480c7b-808a-4ee3-bb7f-08d9b0c22813
x-ms-traffictypediagnostic: DB8PR10MB3129:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-microsoft-antispam-prvs: <DB8PR10MB3129C7DF2F24E5EE9520D2EEA7639@DB8PR10MB3129.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wSZxiFbRLRa5Mv2VQ5aQkX2tvkZlspyWZa4GU0pTu9meug9SBhWk5Jz+yLwYtHY4e4MyrPNRE5VR0YJtzaxXxiqSYMAZbtDZAGT4gMvZzW9fTKM4gMUU6lnZAMmnfb65JtPcK7Ytc5P7DHgoKIvfo5v7f8EecBMr4xbBYD89ys1lMVKMiALFIxdA7NAa6xQWaJgsgF/4A/WNRin8O/Wh4Lew49SeEAPv+5n9bt1RXrQNC8PqrHyTrbUlf5WSu1m071KN7bWHqyLzLtYRZ6Gyut2MU3pFZRxJ/A70T/i4RdEdVTERBW+uVHHX71RKm08dwovABqJ86+CxH8Rko4DleFcbqy6Gt9ltjXV/GjRt18maDr1ew+r5RClaxrKLmj1Qa6k9UGg6eO3kmzZSVBTPGY8GL66HjcIKAFe39p2aVLe7aWjJEMoOr2Ze42lC130pBSFbEuHsLAhHnuRvjCMKEVG3kpvUHqGXF83NzJCWW0WhZo7p0ZDwq1bRM5dOaJShoGlQvZNqNcAMZsQbVryqv+houB/s0mRSAkFHfQTPccU+Q7ohM0bhKsskzgK2TqOAFdU5dcwQqVl6tExYzjGSgqjo2s1NMrU6k1H2iwYuTlvri7u3aRxTHzoZKwWmjQe//i67/6ThZZcFD5yXQujn+pAvaihlihYc8f9qDcNzjjgNJO9VCueYOlxeIbLPL42Hi5c7NnQSklusRjSfX4xmfg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(186003)(52536014)(33656002)(64756008)(8676002)(66556008)(6506007)(38100700002)(66476007)(38070700005)(66946007)(66446008)(54906003)(110136005)(8936002)(2906002)(53546011)(508600001)(9686003)(122000001)(7696005)(26005)(83380400001)(76116006)(55016003)(71200400001)(86362001)(4326008)(5660300002)(55236004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uyiuTjZtrBKGiuiVcR9FNYqoK4wMPjz2Z6vFEgVhfwQXaFsP2negksBTo/Kp?=
 =?us-ascii?Q?N62oAn4jUaMjF7ACaQdcxKyi5poHY/59dmZBg9I7VNXLm7ldpYcxaV6/+avy?=
 =?us-ascii?Q?VOL9fFHgnaTeGcWK3owNmmtZDA1R3qeADVLGs8bFIUAUjZfDqsBqVXf3MZpb?=
 =?us-ascii?Q?YCC/Q/Rdwwdw6s9qee2csdd0dOFsoip+CZKjPsuoqjuwVzoADqhFFYSH2q2Q?=
 =?us-ascii?Q?Ljo7Ulj0hVBEM1pAvbImUmHFimbYkxOZJkHhWWUwiKH+P1UnrYKItrXgHyhH?=
 =?us-ascii?Q?/pSxvTCuFMuEHMqKl8e04TvwOtItcXC2bCuKPxY7Wk9O6uH1bbuYO2fSqJdL?=
 =?us-ascii?Q?4o30u05XnD/m7R06mfxWtTPsOeOyDWMC4p8Wzx2s43txceYIMode4mJ55eJi?=
 =?us-ascii?Q?QZBwnTmIExdxN6mCsNmoCfcQwjrDizuZ299rcJuo+8G4WeeICmVgo4Z/3h7n?=
 =?us-ascii?Q?6wd+sZDI8IsknC3zjF0LWFJEPMkPVa4H/aVv0U88vlwAah+KSpK24ZrKyan5?=
 =?us-ascii?Q?Cvnqd11OV349cB3HZfb25qh1byl2gG+/9bBfpL9gAJlIRpg2ulFI/xK9LL4L?=
 =?us-ascii?Q?ieUQUokjJfmbupyLaigBlAC0tkdH4cbIAf0ubBN4llgo8q7bHgveEl4Jognn?=
 =?us-ascii?Q?GKr2d5afPYWYLQ0/btzAno1YW5UF7JaOYNd6vbPZIXH6e3WXrD6dHGua7QwA?=
 =?us-ascii?Q?eU3MLflA8qcvCPQtgpfF3zO2oo82GDLNI5PyEZqy6GcWlX7bY4vPohq76lFP?=
 =?us-ascii?Q?2UWuaGRPEwUB7ylIcCIDv4eNpG8hhdct1x9xfrg2/mdzb+3tuXvvgAFAeIpt?=
 =?us-ascii?Q?935Nyoq1XCirZB5sXmjtFHHCpmctN4TlkgHTKOYSUkGLdPmYzjOuz7NZpeCr?=
 =?us-ascii?Q?CTx/r0Z0eAbAZRQ3w47JaWhc48H+STGcf0NPuqeJZTsNn2d5paGT9rnMovQo?=
 =?us-ascii?Q?gWGqWQU0OJhPh+oju5PeAhPkVDt7pfcGTFc6TVtePALHVsywOQVuiZoEFvR4?=
 =?us-ascii?Q?7gbQ9r0v3mu3mjL9ymOgW9TzExWALSCVV6OHthHzk3gbjqJoA5iOLnoZGXWg?=
 =?us-ascii?Q?yuCLl+X1Yc+WTcWxWNcAaE059P6ACVJYDZk5Cg5WLCA79vFs88IJSVAwQXqg?=
 =?us-ascii?Q?+zmGROhDocTwzFLZU3V5zBNvZ3CmgwZ5m4xDQvh6MJAfs8My2HRz7KD5Al5h?=
 =?us-ascii?Q?FCi33NGb+qNB/6VaND8z9bD0BEa0J6kuIG6vtnGVRJ8KjOsrdAPfbhpkcVLD?=
 =?us-ascii?Q?IOFEGM/dnUovcBvpYMmUOqe3YGeKw0oCpwiV6vw2fhiySnq01jVIxPWx7ZWA?=
 =?us-ascii?Q?5Wgizd1aS4D7UQ1YGMqMyf56n64ihBUMXSaxtR0PkiXX7gNBwZQqyS+VdB3i?=
 =?us-ascii?Q?YimlYGs/nnRfwvu7qzE52CAip/pZETy+1CrVACVIV5gylQDlfG02UkjEEyVw?=
 =?us-ascii?Q?bel8twY7YVhN9WtxECyo3xuhv0jZQS5OWu7HaBgHskskMJRN+gdhOLaA8zzQ?=
 =?us-ascii?Q?beB+bwP9rcrTeRWBDxWDLadyEcudDv/sUODXeDvcTo038rIazwIjmb6Wodgl?=
 =?us-ascii?Q?QkihEYRSfMcuV0rRkdYZNf2ZoSXnRZmopjNMQZ6cDl4AqncMbeSsMK1iT+Im?=
 =?us-ascii?Q?qpnWgJPZLfyic4GBlbQ8dXgbuwYLnBDfGGte8kP/tcX6fEQhc0uKShSXNRPi?=
 =?us-ascii?Q?EMchLg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b480c7b-808a-4ee3-bb7f-08d9b0c22813
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2021 09:50:18.9105
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8Uw7oYy9n2xY3iwBNdj6Zkn6DwUpiv2dignpBE3xBC8pZyes3uzVysvGQhBKFPwDVAt0lwdV6d6DYUQhINgm34NYLANgDHFfb+y2sTu8sFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3129
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 26 November 2021 09:10, Nikita Shubin wrote:

> > Can you please make the commit message more detailed, explaining why
> > you're making this change; what it adds/fixes/removes/etc.? Right now
> > just reading this I'm unclear as to why you're adding a call to
> > device_init_wakeup() here. The generic I2C client code will mark the
> > parent MFD device as a wake source, if the relevant boolean 'wakeup'
> > is defined in DT, so what does this add?
>=20
> Sorry for long response had to double check setting wakeup-source in
> case i have missed something.
>=20
> I2C_CLIENT_WAKE is set in of_i2c_get_board_info - the place da9063 rtc
> would never get to.
>=20
> Setting "wakeup-source" for pmic indeed marks it as wakeup source, but
> that's not exactly we want.
>=20
> What we want is "wakealarm" in RTC sysfs directory, to be able to set
> alarm so we can wake up from SHUTDOWN/DELIVERY/RTC mode of da9063.
>=20
> We do have /sys/class/rtc/rtc0/wakealarm if marking da9063-rtc as
> device_init_wakeup.
>=20
> Unfortunately marking pmic or rtc as wakeup-source in device tree gives
> us nothing.
>=20
> ls /proc/device-tree/soc/i2c\@10030000/pmic\@58/
> compatible            interrupt-parent  name  regulators  wakeup-source
> interrupt-controller  interrupts        reg   rtc         wdt
>=20
> ls /proc/device-tree/soc/i2c\@10030000/pmic\@58/rtc/
> compatible  name  wakeup-source
>=20
> ls /sys/class/rtc/rtc0/wakealarm
> ls: cannot access '/sys/class/rtc/rtc0/wakealarm': No such file or
> directory
>=20
> So i currently see that either da9063 RTC should be marked as wakeup
> source, or the da9063 MFD should somehow set that for RTC.
>=20
> And we want this even if CONFIG_PM is off.
>=20
> Mentioning "/sys/class/rtc/rtc0/wakealarm" in commit message would be
> enough ?

Thanks for the detailed response; it helped a lot. Having reviewed the core=
 code
along with your description I know understand what's happening here. Basica=
lly
marking as 'wakeup-source' is simply a means to expose the sysfs attribute =
to
user-space.

Yes I think in the commit message you should be clear that there's a need t=
o
access the sys attribute 'wakealarm' in the RTC core and clarify exactly wh=
y
there is that need. Your commit log should be good enough so that if anyone=
 else
needs to look at this later they completely understand the intention behind=
 the
change.

By the way, I assume the functionality you're looking for could also have b=
een
achieved through using the /dev/rtcX instance for DA9063?

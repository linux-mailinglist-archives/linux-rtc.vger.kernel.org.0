Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD452B5C1D
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Nov 2020 10:47:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727655AbgKQJrC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Nov 2020 04:47:02 -0500
Received: from mail-db8eur05on2069.outbound.protection.outlook.com ([40.107.20.69]:44512
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726085AbgKQJrC (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 17 Nov 2020 04:47:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gnaN9kOp52G1lrSHMUjun4NiPQVJrlZxcliNbvXKMbdFIZQXIDZygdeMTKdkqhdvxVdFOFTUVMf0wn5fbiSoQzCnot9rsk05QOrHpTsTg3ndP7O7KuXJgzrFWtSY9AyoPUpgAAvbfmyohW/N0Oxab5S3s+9BlRey2XFxuLSGokVduHPi2rtapmJ1E/kTXsSomdzEd8ZNYHmxe5wBBROeksNONPapuFuMmilnaka+RMPvmySD00QA0GEyp3QXLL9OtyHhRD98Xt1rCaQK8D9DmiWAtVPjbw5/Weed23llJx0J1wg++2REy6sHFKErnDt0HvYQKjZ96kFM1JawIWGOWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFybGcQjzoKjbogRZAKbYZbQMf3uln1Nr/WntFLin6s=;
 b=dLqHy3wmpTwWNJ6HVsQJGNfBxUhejGadn9eP0nAZ4aihMll8ezu9HpwPXbq3NcGhL7hcpnGnkm21/DM/I1Czm73ya7UFucOByv7rj54F/vIMAb+ZXFjknPV1xOmcxssgXDAE9kvAS8SnsFLSW4y81UxUZuW0wU8dfQ0IB4JmgiJJFFowQKp836S+CAWEuKDglHwVuUsDZpvrWAaM9fGF6fOuO6Piub7nD1OBxZIxPQbYpvcrsZmB9zMaCLdFi9mhynbu67Im0S90RK4icZe3DOf2X1TaxCZ7t3MMvMuVmTjQft2Yu/CT5irHpe/wcXUXU7LqTBBXpMkJG1JH5lmLpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFybGcQjzoKjbogRZAKbYZbQMf3uln1Nr/WntFLin6s=;
 b=DEeNm6VLSS+DPKtN39k0KbzuevlbBy5gGS/PvS6+wyt1dVzFN0Z9th/JWxtkh17UlLDbb6qYiu+lOQnYLldiiQwFrkOuzi277GNjeKBwQEfGATKbSKk2VVnq0hnCtFH2JoNajfMEK7y4RbwiEmPIapUB5ZyJMwazp1ivPWOsfMs=
Received: from AM0PR10MB3169.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:18b::8)
 by AM0PR10MB2275.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 09:46:55 +0000
Received: from AM0PR10MB3169.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7dc9:c50b:240a:969b]) by AM0PR10MB3169.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7dc9:c50b:240a:969b%7]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 09:46:55 +0000
From:   "johannes-hahn@siemens.com" <johannes-hahn@siemens.com>
To:     "val.krutov@erd.epson.com" <val.krutov@erd.epson.com>
CC:     Claudius Heine <ch@denx.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "werner.zeh@siemens.com" <werner.zeh@siemens.com>,
        "henning.schild@siemens.com" <henning.schild@siemens.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        "martin.mantel@siemens.com" <martin.mantel@siemens.com>
Subject: AW: [PATCH v2 2/3] rtc: rx6110: add ACPI bindings to I2C
Thread-Topic: [PATCH v2 2/3] rtc: rx6110: add ACPI bindings to I2C
Thread-Index: AQHWuPTkrrRdrk6ovkKnOm35yMg2kqnK3KGAgAAMQwCAASVdsA==
Date:   Tue, 17 Nov 2020 09:46:55 +0000
Message-ID: <AM0PR10MB3169089EF445E785C363A0B4E7E20@AM0PR10MB3169.EURPRD10.PROD.OUTLOOK.COM>
References: <20201112130734.331094-1-ch@denx.de>
        <20201112130734.331094-3-ch@denx.de>
        <20201116144631.GB1689012@smile.fi.intel.com>
 <20201116163024.74c767b6@md1za8fc.ad001.siemens.net>
In-Reply-To: <20201116163024.74c767b6@md1za8fc.ad001.siemens.net>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2020-11-17T09:46:54Z;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=d04ab8b5-e638-4853-86fd-e3609bc86278;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
authentication-results: erd.epson.com; dkim=none (message not signed)
 header.d=none;erd.epson.com; dmarc=none action=none header.from=siemens.com;
x-originating-ip: [165.225.26.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7f0b7405-b473-4c00-ff1d-08d88addb858
x-ms-traffictypediagnostic: AM0PR10MB2275:
x-ld-processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR10MB2275FD5982D2468CE6658FB8E7E20@AM0PR10MB2275.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qt5KL79nFeNQE0PR+7b25wJ5aJwJmN7cKxmBX+P7cAMRdpiA4cT1ptoig8vPKqvBfXyzg9A0GI0EQSxrul+9s9vZP8FncYpte/ww6mAwrYWM1KLA5a1A2dls8Oq4npz1bDnalIKETvx5nrzm4UkTOPH/X2T8JSkHxL6IG+M7yuJHDvALcrEwQjYq+EmtHYDfkE3PBNewNjpqn+bzdpONEfAD4m+3qRgv9P7ypF1QHorle+n3Y5Ej970IldSfO8DU93bV3duCjaoZ2bmg/MxVottSKM6y4o4Qe8ULA7lrYjiKtipvoc5wGHQlmkyvsRxU2ecV3kuYI7uvAajPnyUQWDfkNhQ/ZsOolWbz4DjeC489pqzL5NWhAhdDwX4/U9ALKvgNaxwoqY1eoX2nOv+7ja3jb/q6WedzBGxaIe7uhRRCMVUE1DLFFmOOaqscBowB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB3169.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(55016002)(2906002)(7696005)(4326008)(26005)(6916009)(966005)(45080400002)(498600001)(86362001)(9686003)(8936002)(107886003)(54906003)(8676002)(55236004)(33656002)(186003)(6506007)(71200400001)(52536014)(66446008)(66476007)(66946007)(76116006)(5660300002)(64756008)(66556008)(66574015)(83380400001)(36394004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: EnVhxQqdlGbkK7xOu07yoXdBn2UdTYeaFMnwRlIH1gm643zo+SNiDvqyYjLdKily+mMPEPZKOXHAdaVCYAtrzyFw1LxrUzjVOjaRgAXkaSqJysLDnF0sZ1yu3XDSmTajOChS7V358icu7oeOAr4NXyzhVVHjfJn7x/2dnvOkWPkAmTQDl9Gi93LHg3wydT3aau8AZWwQbRVjTQ30BwttR9tDUi7efUPMLDGhjqZmF0BRu4nV4GxXx4Ok2XamQtP96Tz56t7hWuKnmP8csGLPLvqVt0oEyO8SBuiRC4xxD8i99dA6Cmi47Fpr5oR7Wc0ArNNIsMyuEmXcRvCUSq9iuVjs5NwfJbIqfyYNAglEVWn6Gm8/M90SKjDvmTHg6KRQhgmxMi63MjrDkERxYfvjzLLPY9nvGoKWw6TFIPVfcp6DQBzlG7oFrZ6N4T15pLVIcKQuIgQv7cPI+KTmdjMpKo6UeJDk+6pu/XHzYb1Mu76+BYjisYwWZ+xlZXoue3lJ+IDsSggaUrxTS1Q+PkQt2P7pr4QyzrRicpMNSJZXLFjKbSWIuhdJni4rIXCa7asNorKaA80D5OI61VSvvxBWwY2QWaP0q9oLa+TjOVZpilRL6iPC30WaXXmTT5QW1e5g1nrJ+Hgpdei/GpeKJn++z5o1sGCc5CohWvjE9WjweV/Pqk1vyQeS3ce9YGKPreJCegcFngIgZrnyVNHQ53DZ5vsbxdpelJJnmGNt+ZE6GhalhCTLRF6pSRN0c0dfHcdprcfHbb0l3u4Ud/8mtXBZmeTvmF14PgjZhHUIMUxWpGxr4oa0tyxtX/ZMnlZOtWFJs41nuDsHMfWrIKYADqj3GIQuTqwvGNGFh2bakAXaUiiaolqbQVcKBMf+kEfA2HeUR1sodKT9rXDtUDrqPxf82A==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB3169.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f0b7405-b473-4c00-ff1d-08d88addb858
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2020 09:46:55.6548
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gJDlfFDv4BZXyVzy/Z6aoU3/j8aDgqqml5h684MGFXCA+wWE3PZdTMuHOeplI09YVFMC/8DQ/taoyQ4ihes6meaeWLK18R8QiOMO1Wgxc3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2275
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Val,

my name is Johannes Hahn from Siemens AG in Germany.
Our product Open Controller II (OCII)[1] uses the Realtime Clock RX6110SA f=
rom SEIKO EPSON.

Currently there is a merge request ongoing for the Linux Kernel master bran=
ch[2] which adds I=B2C and ACPI support to your original driver implementat=
ion.

Simultaneously there is an already merged patch-set for coreboot[3] availab=
le creating the ACPI (SSDT) table entries for the RX6110SA.

The OCII uses coreboot for firmware initialization.

During the merge request the eligible objection arose that the ACPI ID used=
 in the Linux driver patch is not conforming the ACPI Specification.
Indeed it does not. But when searching for a  product identifier of RX6110S=
A I was not able to find a sufficient one with respect to the ACPI Specific=
ation (see [4] chapter 6.1.5 _HID (Hardware ID),[5]).
According to the fact that there are other Linux RTC drivers on the Kernel =
mainline[6] which support ACPI matching that also do not have ACPI Specific=
ation compatible IDs we used that as an example for our first patch attempt=
.

A PNP ID for SEIKO EPSON is already registered at UEFI database[7].

What I kindly ask your for is an ACPI Specification conforming Product Iden=
tifier for the RX6110SA RTC ?
According to [5] this Product Identifier should be "... always four-charact=
er hexadecimal numbers (0-9 and A-F)".

In case you do not know it our can not acquire/create one could you please =
redirect me to someone from SEIKO EPSON who can help me with that demand ?

[1]: (https://mall.industry.siemens.com/mall/en/WW/Catalog/Product/6ES7677-=
2DB42-0GB0)
[2]: https://lkml.org/lkml/2020/11/12/561
[3]: https://review.coreboot.org/c/coreboot/+/47235
[4]: https://uefi.org/sites/default/files/resources/ACPI_6_3_final_Jan30.pd=
f
[5]: https://www.uefi.org/PNP_ACPI_Registry
[6]: https://elixir.bootlin.com/linux/latest/source/drivers/rtc/rtc-ds1307.=
c#L1142
[7]: https://www.uefi.org/PNP_ID_List?search=3DSEIKO+EPSON

Best Regards,
Johannes Hahn

-----Urspr=FCngliche Nachricht-----
Von: Henning Schild <henning.schild@siemens.com>=20
Gesendet: Montag, 16. November 2020 16:30
An: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Claudius Heine <ch@denx.de>; Alessandro Zummo <a.zummo@towertech.it>; A=
lexandre Belloni <alexandre.belloni@bootlin.com>; linux-rtc@vger.kernel.org=
; linux-kernel@vger.kernel.org; Hahn, Johannes (DI FA CTR PLC PRC3) <johann=
es-hahn@siemens.com>; Zeh, Werner (DI MC MTS R&D HW 1) <werner.zeh@siemens.=
com>
Betreff: Re: [PATCH v2 2/3] rtc: rx6110: add ACPI bindings to I2C

Am Mon, 16 Nov 2020 16:46:31 +0200
schrieb Andy Shevchenko <andriy.shevchenko@intel.com>:

> On Thu, Nov 12, 2020 at 02:07:33PM +0100, Claudius Heine wrote:
> > From: Johannes Hahn <johannes-hahn@siemens.com>
> >=20
> > This allows the RX6110 driver to be automatically assigned to the=20
> > right device on the I2C bus.
>=20
> Before adding new ACPI ID, can you provide an evidence (either from=20
> vendor of the component, or a real snapshot of DSDT from device on
> market) that this is real ID?
>=20
> Before that happens, NAK.
>=20
> P.S. Seems to me that this is kinda cargo cult patch because proposed=20
> ID is against ACPI and PNP registry and ACPI specification.

In fact we pushed it in coreboot and Linux at the same time.

https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Freview.=
coreboot.org%2Fc%2Fcoreboot%2F%2B%2F47235&amp;data=3D04%7C01%7Cjohannes-hah=
n%40siemens.com%7C21c9e1fe99274df7951a08d88a448af5%7C38ae3bcd95794fd4addab4=
2e1495d55a%7C1%7C0%7C637411374276831534%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D=
7EVdO%2F77LNyvux0y3m9nEf2HZO%2BDm2WkWMfxzaJUoto%3D&amp;reserved=3D0

That is the evidence. But in case this is wrong we can probably still chang=
e coreboot, even though the patches have been merged there already.

Maybe you can go into detail where you see the violations and maybe even su=
ggest fixes that come to mind.

Henning

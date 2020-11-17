Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD4C2B5A56
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Nov 2020 08:37:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725730AbgKQHhG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Nov 2020 02:37:06 -0500
Received: from mail-eopbgr80072.outbound.protection.outlook.com ([40.107.8.72]:14402
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725771AbgKQHhG (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 17 Nov 2020 02:37:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLhyh87Cue9PcKOxjJGyhN5xyMnQNw0Gb7W2QFMBucexDAulqZObPUciDAc66jjvimzTD+iRqkMhhfpl3wEeMlurShBPbdqd4mSz+oyNJ9GAelLLQQikD7owrvls0Z0uIje+5oBaSQxJrFChygE6lRWS9QBmoBY/eqlsysT+QSBFlxKUjHBOPbUVcqtCkE3ABT4M3d64qBCdN58UuOK75AdUMRw9KBASb6wDAYEKsjEnAkiypjzorx+8ccq4t6p9ys8EjkCzSJwqUKzzf0YY93ABKuzOm4TCDzHqMW7a0JGRq7pvKPOOLQkpSzmo9c4ihdS3nKTYVAHhn65oj0iBPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tiTVIHmcgu7YFZ+t/WmGsQhbTjL9n+uDAo1+wB4S+xo=;
 b=C73Bbl04EfEoZ2N7kzfKUpGVI4BF+6+e8eNW4SYrt00IOErBVwuwfXcFyxenzUkobooNfE3S6ffRx7fkWFrT6Ns8q2zG2COtBvDHcMWkiR7AbBaLPbIf4WVrT1bZ0/Ue0KlQfrxb5zd5Ajv//V2XBD07MyN4+nFJaV99kiepUFv7zYj6NFKOMTa0/dxNM/p+20pBeVZqzzBc+Mk4GgM/MCDKgWrtMImCb1irQvnmdG6lF+bkrgpisooJ9kXuFF5jW8A+wPnh4ps7NQdz/dMLwQfDZmcfmmtmUHffHf2R5tEJu8Apj15ZbG4ClWBAyj5LDHFgNho0SM0R/bJVPKz/qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tiTVIHmcgu7YFZ+t/WmGsQhbTjL9n+uDAo1+wB4S+xo=;
 b=SV8av0zhxie267nGNOcNvEihsjjqXzq4MYeSm2YJPFMoFhr5ixW6y+rs70CHam/oZbtZmmSAyN7Ce8xomF2GV5kuHW+4k+KbrE46WbCRtlbajWluFUwHsYPrS8ZyVvDlVa05j6mPy7Ezvsmiptk3u+ooDVjmIb9//5CKRBNSb+I=
Received: from AM0PR10MB3169.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:18b::8)
 by AM9PR10MB4200.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1f1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Tue, 17 Nov
 2020 07:37:01 +0000
Received: from AM0PR10MB3169.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7dc9:c50b:240a:969b]) by AM0PR10MB3169.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7dc9:c50b:240a:969b%7]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 07:37:01 +0000
From:   "johannes-hahn@siemens.com" <johannes-hahn@siemens.com>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
CC:     Claudius Heine <ch@denx.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "werner.zeh@siemens.com" <werner.zeh@siemens.com>,
        "henning.schild@siemens.com" <henning.schild@siemens.com>
Subject: AW: [PATCH v2 2/3] rtc: rx6110: add ACPI bindings to I2C
Thread-Topic: [PATCH v2 2/3] rtc: rx6110: add ACPI bindings to I2C
Thread-Index: AQHWuPTkrrRdrk6ovkKnOm35yMg2kqnK3KGAgAAMQwCAAQk1kA==
Date:   Tue, 17 Nov 2020 07:37:01 +0000
Message-ID: <AM0PR10MB316964C5127D27DC9D7C3DCCE7E20@AM0PR10MB3169.EURPRD10.PROD.OUTLOOK.COM>
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
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2020-11-17T07:36:57Z;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=a252ff8e-45bb-49e2-9a1b-b90427399ea7;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=siemens.com;
x-originating-ip: [165.225.26.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4857c2f1-ac5d-43c8-311b-08d88acb92cb
x-ms-traffictypediagnostic: AM9PR10MB4200:
x-ld-processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM9PR10MB420035FE336F574EEA067875E7E20@AM9PR10MB4200.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xK3zPx8rRYZaceAZBkU7+S9emo8//ZMwZpVE0xXGH+0JrQpb4LRPjLGE1zrmnZbf8aiKXigk+pP2GxbGzetSJmUy/tDLM9QvzJveyHU/3HiyN1MbzqgDYW2YqimiXw/Xxs4cRMWwgTBgYXUb8FlRH9oJqE3PAhZBTA3vAgixWqrS1d1j5MD/giTTf9G+f73Wq97FR9tCk+R18tPFq/Txt/wk0/W7ERhNQg8hVGCJd+tKnQiV4yPnK2rYcuGHwkN6c+YTAq86tD3dn+4F6Kj+p6LrKu9M6DTy4szvHfA4Qj4AuusHBrfpbCHO25WDQER9DY8xeFPlAgKSVH23Ja4Ip9GjcggVE1JcGGd9N7u0glyHkkpO505CD+yLcvIw4fT31SrjvymDNpIbAtTykudX7g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB3169.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39860400002)(376002)(346002)(396003)(66946007)(26005)(66556008)(186003)(66446008)(66476007)(316002)(64756008)(7696005)(76116006)(55016002)(5660300002)(6916009)(6506007)(9686003)(8676002)(4326008)(52536014)(71200400001)(86362001)(8936002)(55236004)(478600001)(45080400002)(33656002)(107886003)(54906003)(966005)(2906002)(66574015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: fNDOAsDztaL7YARBl0FaMbzX/QpbxJePotkt33BpQWtcAlmagQ4AADQgbZ+zwEmtBtGvARHU16aM+XEMI+MvxiCVDgYFnz1/thay0N6HZLTJQqy5wevcH7xsZCS9WiNYoivlQcOsyD1xjKj8CqEQzDsLiOjc8036Z3QzZQm5RAxfIq45mQlsGJlpy2fZcmkGRu6X7WS2qRsZOSHe3lY2leI3WkZw1wqEGRuwmIoP/F32KQJWr0L025AT/u4b9pnGyrIPX7BDOGPlBNkPvmf8HvngSb7FluHCqfN/81iP0CIZZbD2EP0tuzdGi9oDb3am7HaIILVrjPDErO69VByhy0qk7NY5XWYafeZpheyiWr7anp5PfQ8BIYa8ocN7zOmWaVC5kUZUMjZTVjpU9q0Jrgvx9y+QqdUNcwamlQISkQ+BejejVuq2H610RYzNjheoR/ZfFXfwSYCIZ/jcdbSQRzyKTvURpKJFZ6uU8lfkGxj9pzZpewusGhUfQmq3a0i1dFk08GAPjHNPrRJbtF6KH8+kg6zVWVlkXw1ckUsGlhKTyWXR71nGyxKbgA8nuV7MDDr33+BA+rODlvBW1W5IZTO55WswebYeysuGkRxBBWoihkDLDx66r8IOkLGxqReBewxM9F3v5xdRPd+18FMyyEMmSPFd03mAhnpMW9iIJ0J0mrIq+pg6iHyFVUAEal9j80l2eIqG3F+aO9OZdQe59ow5hB+7b5GOkLJtmi61f5L8mMf+XLe9sqxQW07iQbaEWfc9/+z91wDF+oXa4OwODDQQx8RHFxtUZ5fbHd8vOiOOYinu4IP1MmsGw8mkUU6RZkIHlesjZ76MIY0054UTqicfQblicjSqMXCQlB7BmiD7cY/+WKTCUGBoI2/FN0LgbbeXGuuKj5+XnyX1GlxKjA==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB3169.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4857c2f1-ac5d-43c8-311b-08d88acb92cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2020 07:37:01.7872
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4fxT4c+iO2vqGK8IcPY2y/hnxSD4NRdN4pu8vYR8smZeEKWlz9RREC80qqVfWSV51YGf02mXh6e3bbbkBM3iUeUBcp6cdN8tBQBsAqnAw9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4200
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Andy,

when comparing the ACPI IDs used in rtc-ds1307.c, which is already on mainl=
ine=20

https://elixir.bootlin.com/linux/latest/source/drivers/rtc/rtc-ds1307.c#L11=
41

for example. Every ID listed there is also not formatted the ACPI ID , PNP =
ID way defined in the ACPI spec.

How about that ?

Best Regards,
Johannes

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

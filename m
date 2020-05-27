Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 565381E3402
	for <lists+linux-rtc@lfdr.de>; Wed, 27 May 2020 02:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgE0AXg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 26 May 2020 20:23:36 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:6095 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726857AbgE0AXf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 26 May 2020 20:23:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1590539015; x=1622075015;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=T+XX72NM0evWLhAQu55bnnX5Y00pEt9zE7eGK0MnvIo=;
  b=REzZao1lK0VUQcrUFA+xStHM4ksbMZ0pe9tntl0+yxuOmCcBlnNGJRzD
   eDHF8lskdfHYW50UnzV3tduAZFu2wvzC36YmBQqDcoymZ+l1+iGgrwL79
   //bMCaqpWIOlGccecQTPTcadsTiS0GUBLPp9Ai5bcfDHGcQaAtG4dTqoj
   6qq/GLuslYDSbYyZEgxluuUPJ5GJfhEMlx2WyxL2zjiVc61mM0gPQaAci
   SJpq9UDQQj0TaCZrYr1Gjd213XsM8tTME8Z8qAU9/Ku7KvYNyhMsM1Igy
   mJEt0af0kgrUyreCceFwyTTx5YmTX1l6JDXlkxi/oNEcMt3tmuMM8Wppo
   Q==;
IronPort-SDR: wWG+WLjbkKtaBxbjrufUhtjnWT2dUK9U/OX59UWGgKAeR9RG/DHT707UBD0nMWAMoCNzVqUDP9
 2kpVOvyClFmh8env/Tg7u/OS7TAqVZLY/z2CtJg//A0yLSEDzRjICllurTYZe2luk3Iq5qrTzf
 sqft9oRU9gJ6fUirHpRxXaESvBEn+vlVrOR+lVzBBbttIqNoWCVVtOlSZOZXRnP/99MSj+ntBm
 07YbTPP/ZlQmOYdk9zomUvthsrr9yUuGNMxdcVTbrVOCHR7I3sGR57uzNTTEg5DqnMTPhdqM4N
 KUE=
X-IronPort-AV: E=Sophos;i="5.73,439,1583164800"; 
   d="scan'208";a="138893950"
Received: from mail-mw2nam10lp2102.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.102])
  by ob1.hgst.iphmx.com with ESMTP; 27 May 2020 08:23:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8wVxUnGi1Gu98/B5VWsgpQNBQ8oiRn7r/HNf+Cu2pJFl6K/UyHx5YmFNtXqL75TFa537nKTfy7zTRySzdmiotK+Ujo1FBRiJxg/LDjyq9HLq7W5jbzgltZq+7XnfL/Kh8z4FSmChF3eVYUD7Lr930WFwfyWvr/OGrGE5a3ywzY0o1T7BaffMotPzIFbO6+SzuT7xVWCGRKtMj/ISvJ+GExL2omPIRqH8ElA1nuEGiPxm3wwXuoS42q+FhZCxT/793lEUhC70+3JFTn4EgNEbOj93H3yTcVcwFcm/9nxIOnDz8yiAnpISxpnC3if9bMV9ph4zf+wv+x1Bexygp7yKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOcYvFe6IGZ/cmUiIpAKQVV6rD8BhKM1SEA6Udqgn84=;
 b=IfhFyf31T9L5sgSXoujrOaxy0tK8LOw9vBTWy4y5UsZiR9rx+9caRBWHmArv9Z6pMoBvHswSNr0Wd3uZO2lv4Tn/rLSkHQ1Pv6NXhE4a+9Fl5h5+2OYSNObiEsDPiBj/ZagSaslD8CDGF8KJlHpu28Wb/vI2aoCnT8/ByCQ3MtaUQ0yxENof0Lh9rGpr2+xz8GUynLh7bIxflgpIixffwhXPXDGVaGyMOTpmqVOiJb6ZAlP6cmZpk8sXbJFN2xvTET4g9AHBfLnYtI8UmG0ZQDMLC3Emje5bO55M/EVBqm/2BslavJSpJbZtXkRrPDc6GEQc3tA6qxT15LUotaOs8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOcYvFe6IGZ/cmUiIpAKQVV6rD8BhKM1SEA6Udqgn84=;
 b=mov/6WSSHP+niuABnwC0KgynVpvoWpkmq4kPJPSbwn9Gf51Cg33N7b2SEsBTHu5q9Lu6eTPxYTJ4Uc7o672pYB6D/7XxfslncuCVM6MkEk9h2jMUtLGQDI6P9W7d9K1U4fi0bu25mus0eyk6NPCfCd3D73hMfrnomrk1+8h0FcU=
Received: from BYAPR04MB5176.namprd04.prod.outlook.com (2603:10b6:a03:ce::25)
 by BYAPR04MB3816.namprd04.prod.outlook.com (2603:10b6:a02:ac::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Wed, 27 May
 2020 00:23:32 +0000
Received: from BYAPR04MB5176.namprd04.prod.outlook.com
 ([fe80::893b:8b7:4e88:1466]) by BYAPR04MB5176.namprd04.prod.outlook.com
 ([fe80::893b:8b7:4e88:1466%7]) with mapi id 15.20.3021.029; Wed, 27 May 2020
 00:23:32 +0000
From:   "Maciej W. Rozycki" <macro@wdc.com>
To:     Mikulas Patocka <mpatocka@redhat.com>
CC:     Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Henderson <rth@twiddle.net>,
        Matt Turner <mattst88@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v5] alpha: fix memory barriers so that they conform to the
 specification
Thread-Topic: [PATCH v5] alpha: fix memory barriers so that they conform to
 the specification
Thread-Index: AQHWMSF3DuFqYbubD0KT3K6x/SG/Xqi3VCwAgAGCAgCAAA3VgIAAE0iAgAAMfgCAAXN7gIAAoJCA
Date:   Wed, 27 May 2020 00:23:32 +0000
Message-ID: <alpine.DEB.2.20.2005270119170.1027@tpp.orcam.me.uk>
References: <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com>
 <alpine.LRH.2.02.2005220920020.20970@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005221344530.11126@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005230623410.22664@file01.intranet.prod.int.rdu2.redhat.com>
 <20200523151027.GA10128@mail.rc.ru>
 <alpine.LRH.2.02.2005231131480.10727@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005231134590.10727@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LFD.2.21.2005241500230.21168@redsun52.ssa.fujisawa.hgst.com>
 <alpine.LRH.2.02.2005250944210.26265@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LFD.2.21.2005251500420.21168@redsun52.ssa.fujisawa.hgst.com>
 <alpine.LRH.2.02.2005251149540.4135@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LFD.2.21.2005251729110.21168@redsun52.ssa.fujisawa.hgst.com>
 <alpine.LRH.2.02.2005261044440.29117@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2005261044440.29117@file01.intranet.prod.int.rdu2.redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Alpine 2.20 (DEB 67 2015-01-07)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.240.244]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3839b2d1-6839-4c93-5d59-08d801d43037
x-ms-traffictypediagnostic: BYAPR04MB3816:
x-microsoft-antispam-prvs: <BYAPR04MB38165782A1AEF4F0E7FB1075B7B10@BYAPR04MB3816.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04163EF38A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cmNRh1WqZihgi81RWGURqH1ni9TqJMpYepf/CMKMwmjx4G5upEKAQXwGHa/JiJquUHfbFq9DIAdsHx92wOqanskONjhhPtqfiOwBmK248yg01NncGMTtCLHZuYR9arfWYYqEhxLMgj92vcB7v6VerHEgD1H4PuTpR2EI4A2nSk9h5G/cocIwlL+GIJYM60TM1QHi3wr0apKH+1ytn59c7EOhGeMDMiSrwdQH6qKPhAI/YU015VQmoutv1BpyG5l2v0miW3hT+BARb973/qTbAdSB0qVe4zwhoGYleYIQdZUjMl57LdXdVl7cpABgr+Q4
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB5176.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(8936002)(4326008)(8676002)(6506007)(4744005)(478600001)(6512007)(6486002)(186003)(9686003)(64756008)(66476007)(76116006)(91956017)(66946007)(66556008)(26005)(316002)(7416002)(54906003)(66446008)(86362001)(6916009)(71200400001)(2906002)(5660300002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: Qjs0LOZ0RwaZErm62Caxqi2W+pJQWoW3q2bFGvWI+aA4uM039fs+EuKdS/qMVRFfGuptJEi6Z7uH9j23DfzT4fSk3vXL4FD6k/HTl6iRh/5A202HtHBXupRpTaHaaPLdJyuIAzXik4ztnzmaIjmCK+aa73a+TSos+tYESMZIcBLlfFN0oLP0czcDKMwpAqiLZap0+W6EraiKMcyxYlVbm6+IyCNoWLIW8ADFcF+4gp7HaiXl6V2ns8/CPGwSgroQHwUB3sTCXXkVdOMvmonIBn3opQIVDdwD+K7UU/MhnB54s8eYLRA//w5EbLyC+HhJUFUVUDSeBIvluQkt2uyGl/H6GSf1jRwr5bcy9ruPmkR2RKwkBsByke4OIEDfIWJCfZnc9vGtgpzG9ri4OSrMnycJUZPEuCFeBxWelgDXpNd6Aa2DZkEBowLOzHPuN25GA9G/M8vo3OPRMvoIHbLfE/QfQdNXWjwdugIfURvdG80=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D30F3CB55E483D4AB73C5C54DDD22A17@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3839b2d1-6839-4c93-5d59-08d801d43037
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2020 00:23:32.5105
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G07HQRMf9lfcFbBaf6Hfj1V/8Ahz4Jbwr8KNP2HrSAz8TzqiaIWjcBVfqq1I/EjT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3816
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 26 May 2020, Mikulas Patocka wrote:

> >  Thanks, I'll have a look.  And now that you have this update, please r=
un=20
> > `size' on ALPHA_GENERIC `vmlinux', preferably monolithic, to see what t=
he=20
> > difference is between `read*_relaxed' handlers `static inline' and keye=
d=20
> > with `*trivial_rw_*'.
> >=20
> >   Maciej
>=20
> The patch with static inline:
>    text    data     bss     dec     hex filename
> 124207762       75953010        5426432 205587204       c410304 vmlinux
>=20
> The patch with extern inline:
>    text    data     bss     dec     hex filename
> 124184422       75953474        5426432 205564328       c40a9a8 vmlinux

 I'm not sure why data grew, but still the gain in size is maybe small,=20
yet it is there.

> (I've sent version 7 of the patch because I misnamed the "write_relaxed"=
=20
> function in version 6).

 I have reviewed v7 now, thanks for your effort!

  Maciej=

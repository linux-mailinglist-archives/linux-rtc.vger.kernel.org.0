Return-Path: <linux-rtc+bounces-6410-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPOFFKrY6mnAEgAAu9opvQ
	(envelope-from <linux-rtc+bounces-6410-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Apr 2026 04:42:50 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7394590C4
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Apr 2026 04:42:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7063C30097DF
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Apr 2026 02:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C83129D260;
	Fri, 24 Apr 2026 02:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="leCQaBdq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013019.outbound.protection.outlook.com [52.101.83.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA80282F2E;
	Fri, 24 Apr 2026 02:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776998568; cv=fail; b=QLPkeOB4mqYGluUwL68jjbZS6uwOmQmoL93Fwgr/FwMwQ1Xomvkvvof73eNECa8BxB9q9KwAlPIqyWgD/rzWyF8ir3z66z/Pcn9FoBmPGfm24KbExogz2HPfYTyWtfoVbJBB4elJ3oZZ8a+LEkEqa7sPh6+idPuc6/XVd/ENc+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776998568; c=relaxed/simple;
	bh=zLmMfH6KmoJjyH8l9UINLZTrXIqJjVGkZBkTurel3a0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fqHJjLS6sLZ8MRl1SzDFmcDOCIuOLuFaOCnwJYCs+x1wV6fkL7y3grrVKbR014rXcroehqTCSXr236ENCEak3NaomoFw42WyZWr5CsxRzKseKS241ePpSUBcOI/IvcGE3tMqUgojFAiZLsAvlsI/iZCDGmHnPb5kgIUgHk5HlBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=leCQaBdq; arc=fail smtp.client-ip=52.101.83.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3E/FI9Qu3nS6fNp25/d+ko6n4H/yFOJYmGN4UeG7u3tWc0I2hMMx/2F/El7PGmNRuRe2mhJrzCQZ9rAV07XQW5Ka4f4nVVO8M6fSsskZytpDRilFHJUyO4+oaRCy0PoSDX7bD/g2n6WJlSCLLknwvB+l0KlwQFdFssSLcNci9ZWHd49vmOSrK/7fzT0SjstizzUD5VgTVZ2F6g14TKKsgDgFVCWZkn2s8n3/esdLqmr/rUPVIzUQaH1n5WA0FKDm+qyoZD9O6QAfOzGPad0LSVUewbjgFZhqLcDNxFXURGZ9phGZlh9+/oxFsc5ayQS3++fs5gEwqiLmKiPg0uhQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLmMfH6KmoJjyH8l9UINLZTrXIqJjVGkZBkTurel3a0=;
 b=uVgmhbcpECoN5eLcdVTKHHEUGADD6HCc86JrGapH91XL+BcJ++pLkaLUd6N9Jd4LGBKYwoLu/QhpmIURq9lzxbF9fbmLYuJNipmAZA4YpFbIc/WE3m4msYBcQ6/b7AyZhP+9virDD/zDJnjP85GFL4Wh419jzT2wraE6RD5BEHmyNq11JCJyZVk6yNLrfIl+o7SJ/r3dgSsAnzRkQfANB9Gd7tNR2EnY9UfN3zoXGHqkyMC4VB7WlCtcNwyBL1ZuMPXQIuSqaXCESvWD/K6QdHjlw6WdtEBZC2Hiv9BnnrpR83Mq+2CpUSzyg/J6HheIu7y+oCL86zqyIc8W9ETsog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLmMfH6KmoJjyH8l9UINLZTrXIqJjVGkZBkTurel3a0=;
 b=leCQaBdqhsZl5rGa2rKng5M9XJ24a6G56Z3JAHM2eZ+vQ2sXULA34LI8rNCalRvej5pUhHemzD+y+YJ/aVG0SRX9TXUff3Hm2/d5YjvCITfjQVrFrZM7/o4sN6GZk3ddaem2vmxsmdbziyhKcyAE1poZVrb3ANisCsJiqPJqk8/2ZeStjZuuP74/9/tZPBCH3Nq7VvxAvGSUfIw+oITthfHZ/aIspFKwq4yaawYztdaImFmKkzKyHcJhZYMKyl0/bl+5xT1aUQQpQk8RS45iuviJQY8HARzXjNBvaCOe37SllU4rzS04l4iDIKpzQIbS0TooAn/3js+nBhGxCVIoVg==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by PAXPR04MB9255.eurprd04.prod.outlook.com (2603:10a6:102:2bb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Fri, 24 Apr
 2026 02:42:42 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0%6]) with mapi id 15.20.9846.016; Fri, 24 Apr 2026
 02:42:42 +0000
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"wim@linux-watchdog.org" <wim@linux-watchdog.org>, "linux@roeck-us.net"
	<linux@roeck-us.net>, "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>
CC: Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain
	<priyanka.jain@nxp.com>
Subject: RE: [PATCH v4 1/5] dt-bindings: rtc: nxp,pcf85363: add timestamp mode
 config
Thread-Topic: [PATCH v4 1/5] dt-bindings: rtc: nxp,pcf85363: add timestamp
 mode config
Thread-Index: AQHcWuAAR8BPN5MBkUWbSOAo/I/sE7XucZvA
Date: Fri, 24 Apr 2026 02:42:42 +0000
Message-ID:
 <AS4PR04MB93628F4BEFE9293FC6E457C6FB2B2@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20251121121137.3043764-1-lakshay.piplani@nxp.com>
In-Reply-To: <20251121121137.3043764-1-lakshay.piplani@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|PAXPR04MB9255:EE_
x-ms-office365-filtering-correlation-id: cfdb4d85-d4ca-4fa5-1344-08dea1ab2846
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|376014|7416014|366016|1800799024|18002099003|921020|38070700021|56012099003|22082099003;
x-microsoft-antispam-message-info:
 x7cdvFfyB4GVbAn4FRX9eJ4dAxhCsXOAg0qOnGMBNwFZYCH+L97VmUHSkaEsfpepYLRs6MMhRMzci0g/p19UyQ14WfR+Pxe5bK9PvgD2sCqe5Bks1cp1mwAjLs7q8PiM4pHk9Ys6yUwX7uOiee78KfeJr9XKuB/d+WgevmezrJAOVC2JoNQntHlNAGxtgDxe/DTud+D5Ui4Ndnuk97nNHzeU5hq9iHWpFo7C/tiz2qSTmv3Vwrg0hidO+2UbyRWHOq5QxMdDPqdSGrPigswrR75QpI8I4hMf+MhKHSsRSwU4h56iYgL7xPWjwI2W6mXMPkmTCDR8SEJVRW0jpDINbUUq5Sx0l/rYBmboyw9tgRx8M6j1rRNnDpZ8bKTSq03voHotir7JN29LrIPKhFWhASZEL/bg9bhMAs0hm2POP4FFXMREP8JO/SXbUsucDKa1FFJyVL9Ujw/29APeg4a8+U5aeg3i7dT6fi2Rlnsn7RwBqTein6aHPgMVHAx9exY3aCXMIAN9jaO9Rrv6uIwIRYHq719OKnb539Y6L+nbfQ9w/qYkR2oxmkTU0Ec09oLBvGU5s4IoE3jyhPjGcBiiM3YrxPOJHq5iZysmr5aRhjT545Vqlbjm2v6PaaH9NTVfy77oouYkdHUPxAlcvnZEYilgUmCoizhSh8U+Ln0WY9aXtNnSX9RYlYhKhUmc1UuuQ6IVT4mWVVfhk/M0cxzTwvU98bJXOhqvlwv8L1zHlvjesqd4/rTRI7JSD1gXdRdDYotGfw7rjp9oVXbiOJ/CLWvjLFqRur6egO2d6D/iW7EznpyOgfjCt5YOkP6RVE2D
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(366016)(1800799024)(18002099003)(921020)(38070700021)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fIWUu6wnvh7tJRa3CEFh9MqFBcLV2nS8kIsnhki1ZEQlAlE1yb0MlLrRuiXG?=
 =?us-ascii?Q?xibWVGxVLpU0Mthuve59fpRAzAwQt4MmXPUMK4ydsHs9zW0jrQojDUg65Ys2?=
 =?us-ascii?Q?0BGdvwiHboh0rPCDiwuBdCz+kkjjTQJkXo4o7M0Y73Pc/II8dq3mL8I1PHUv?=
 =?us-ascii?Q?GiQpCmPBoZuJMMyXQl2bDnFd+A6yY2guezgBQMBtQ1hHYL3dlYWWXvunX0YI?=
 =?us-ascii?Q?qgOGBJZ0T5K13S/W2e07+8TIuwEcUZtVKJNkEom5n89qXqb9X19KTEkwNgRu?=
 =?us-ascii?Q?vZoLFzuGxBkvZI1mWT9H8EbYI5iYXXfgm76yE9tcMAD+/fbl7yZmrZisLbxA?=
 =?us-ascii?Q?/1zpr+O32h5+wvm/VjZWEz7HSpA8XgMWY/cpXqUtX9v6a22e+qobTBztAFMQ?=
 =?us-ascii?Q?AnAC9OEIVpYoQ7FmT35NOB1YPC/32TfojWuil84bU+MMs2xyp1UeBCa9fC8d?=
 =?us-ascii?Q?O7z8jr0IKT46a5f9fkyQXu31+lh/2JYLSzjffB1um9otEkJUg7ZpWguR0a3D?=
 =?us-ascii?Q?sKxxIky6JsgjLg+3BFpnunnNvojnDoYgmfjTzRNOGV51Ebsk9EP0bVto60rn?=
 =?us-ascii?Q?fhnK2TYzSOUqqZtKlwDI5WMW7j0lDBj9NClUL7L6Qmd8AclCvJ4dz2VBrD3s?=
 =?us-ascii?Q?sNKo60bfOONXtKpXge8qiRCGw5gfiAWoZ1xilA3AbKomcfNDE/aWOdkuattX?=
 =?us-ascii?Q?puyhlDl5VPED8q+GqSkS5656Lg2lPYpGggXa7SQ3AGtmpyIzFRAab6i4qdHx?=
 =?us-ascii?Q?qKtJ0lHtjQlxvKmxR7Uzm9zV5ypnl2hWpXriYDRkht7fy/Le92KeQyC2v2Sw?=
 =?us-ascii?Q?yB7VcpG7eM71IhvFol3pxXyeeaeSEFIZwOaX1QsWDzwz8tXU0qpxWz855XZz?=
 =?us-ascii?Q?Ov6+CK6rRTr2SN98PrygKiEtWu3TVy+Iw9QZGPQ3k8i4ik+1CrjMVlc7pKfh?=
 =?us-ascii?Q?Sav+92MNYDWVWjfjUy2/mkmUWfAYNfn+2hrptW72TxRRb1JR5g7aaWLePkZx?=
 =?us-ascii?Q?NnZ6yNnPMN1xw8W7QDjpe46m3bKlR9Sroc/o7a/z6iGdN0T7c4Bfp1F0u9x/?=
 =?us-ascii?Q?DhsgOFtPKjIucNiMY7nA410s/DRHOqfpVRH8Uit6MCjjDiijDHllXoWdEXCU?=
 =?us-ascii?Q?Y7uJtB9FWiPn3mnKRIXhkYYsH7/ricggnQMdWzGGGNno3+NzjA/u8Mt/ZrIN?=
 =?us-ascii?Q?bI8rXdNSVUdYXOFF8QalZE89bfcdiAO90iy3LMiqkfj1TK+47vzwj76sSQV1?=
 =?us-ascii?Q?smr6c4W0dN0u9uUgtaZjGJVypBbzKjLPZGrpOq+Gyk9Gs9J5Hyam8SLj9eaG?=
 =?us-ascii?Q?AFmDbXTih/GCck8hmqzobVHdrLkSeDlCrR5rfi/SunaO4Zao7amJ5b6AStue?=
 =?us-ascii?Q?lMSjj+bkL9MCHAh8MA8cmQ7uY2TgqiBnEDgO7/hfiJjM87qg2ozftGgddXZU?=
 =?us-ascii?Q?QomiatDjWEj0t7t3Ov1Gj46CpbOiqe9wl2xOCfqwPFoMlALZZjvov1JgD0xQ?=
 =?us-ascii?Q?ZIGkrcZGqwUZ9WZpoC1wcSXQkEFYKJvcDD8nU7WMwewAgA8j26c3CDwNdyCx?=
 =?us-ascii?Q?fRV3u6maqSzopRpN4vXvGp1R+cfPQtspip42ntr5xllJUusjVPAXKH/gC9fN?=
 =?us-ascii?Q?HWZuhLKZi+KDzuo6I8vVrR+T3QjKeoLKa0/M76cJp/Yg0M/pFMFrO9cTRI1l?=
 =?us-ascii?Q?pQ3Xc6HQa1LXxQNj24TQYtU2ojHJxfb8mg+76pJ0WipL4ZNylMdo60DR9D4G?=
 =?us-ascii?Q?J4cBlu8mVw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9362.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfdb4d85-d4ca-4fa5-1344-08dea1ab2846
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2026 02:42:42.0232
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DiMbwfNP/PUElfpJqRmqoRoKiuWfo/90CyKQgYfrHo9pVKkVHkwWRuvOi/YvKQvTlfZLW3Qj150N5nVA2zgR6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9255
X-Rspamd-Queue-Id: AC7394590C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6410-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lakshay.piplani@nxp.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,AS4PR04MB9362.eurprd04.prod.outlook.com:mid]

> +/* TSR3 modes */
> +#define PCF85363_TSR3_NONE 0x00
> +#define PCF85363_TSR3_FB 0x01
> +#define PCF85363_TSR3_LB 0x02
> +#define PCF85363_TSR3_LV 0x03
> +
> +#endif /* _DT_BINDINGS_RTC_PCF85363_TSR_H */
> --
> 2.25.1

Hi,

This is a gentle follow up on the patch series I submitted in November
(regarding the v4 of PCF85363 RTC driver). I haven't seen any review feedba=
ck
Yet. So, I wanted to check whether you might have had a chance to look at
the series.

Please let me know if there is anything further is needed from my side.

Thanks,
Lakshay Piplani



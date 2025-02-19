Return-Path: <linux-rtc+bounces-3238-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C050A3C4D6
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Feb 2025 17:22:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0AC0189D54D
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Feb 2025 16:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F03991FDE12;
	Wed, 19 Feb 2025 16:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="trKPtPOs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2082.outbound.protection.outlook.com [40.107.22.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAAF1F150D;
	Wed, 19 Feb 2025 16:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739982065; cv=fail; b=PPX7e6UrHCFenc+BEY7AKClwWxJ3A6Ii9hJKob5WhnpFhjuEWrwimjHuHT4wC/xxCtFTbEQJAgdHwO58i8SVpnaSU1c9R7zYghQqqtUDYNhoN2RaiDBHi6JkuPizFSWz/EZncdW/3l9Fu8bjxBtDstLkVhXxLQv+gYK4MCyvGPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739982065; c=relaxed/simple;
	bh=Smgg/gA1nE0pWFlNAxRO6beo61zrSq7OD0rdP2JT3HI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ehcJ0/wRk+VgLJ20pumU/3p7ckrmHs4EGrO0VzwKdTbgip/QRI5xqetu3oH7b1d9MYsWw/DreKJFF7uGXHrcjQQTwcFEsv8sKjiet2wULO3ZXgcM8byd3AA85tislvJ/2D3SrusNNg5hmYPxp6MzIS3+CCbl4f7KPQsAy/g2EVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=trKPtPOs; arc=fail smtp.client-ip=40.107.22.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rfp7fMLZYhBBRlksxZcSkN9quRLbRkID0YrtjgfyzTsUqdByzdtQmiNMEK0elLr8oUy/MQO5oZ9j3LbgRrUATHCq/IubCVZD7FdsQMJYP0fz3Bvy8kJH0ZQUHGTkmTt9XZSMp751D8yYUvIK/QUnA0/qEhT91uCmDPZZ+xOIpUYXk24sQz9xFNROC8aj4j9K1ZCQlQYuR4LpIEr9jVgQfDNuzOBZlDH6yLF2gsFOZQ5lEZCFmDuc4o/1chYdnGmrUjnKtCFz3nYHuCLV4mbS6xR0JZu4goHOx7D+UWhGLacH6dvGNEphFVMSoU0+l75xDBSkev0P7JrUM7hT85TBog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DvyJepwNjo6HN4yJ3Wh2dNWro7BLp+cKYJVg4X+w6s=;
 b=U5qyLOMy5FboAWMcidVnnB4rvOQa9UQj2toP4fx21WyRsDeV7WdbC/10Gvck0BUMOZ5brdXrqR1ofJVTjXArxP+SIq8gyy8Bf+gOfewYSyefTYhwhY6FohABXkWE8nmnrMpfVRrPl7KnfCGLD7nrfHcQbHLpqjpSBIEHrR0balo7SHLp1ZbfOMnKDj44HmS0ltST8SXTUsdLa1sCfK/1hTORnmBAi2WHAqGaKBk+DTqQgN9r+HuTEwDjaidoKFkL58pv2G6vTaUnoclh/UTomNnDJ4DlKIRCvqD3Tm7puI0sf9aNwEdXuL86xuYcgyyifn7/bqIMHPSddohwunailg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DvyJepwNjo6HN4yJ3Wh2dNWro7BLp+cKYJVg4X+w6s=;
 b=trKPtPOs+EGek62K1hrAyMFxXZGQbChts09CdLiPgyuGi5yWWea2x4Q2bYyEN8wAVnLJptxUy3Xt94K/80Xu832e0eb54Ho+vNxa8oeu3aNSqe5nqqmzgdYbiRSVnledMMXDnxVQzFf5HViM9XK5wmEaKF40G39aRMikT8tvzh9ETALpxXhXA/il6OQjaP58VqR9moMRKwCU4hFQFDzfumSFwEoUhRbkOqflsClIRMWObAfFcUsNiwAsI8GJHtdYl/djYWli2YFYDJAzZsluecL4u0HIgAvLHmbM4lqIPQ9ZOBG+b1OOZoVWgNqyqfz6ZGM+7U4HjDl7zhbIT/F4iA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from AS8PR03MB6775.eurprd03.prod.outlook.com (2603:10a6:20b:29d::16)
 by AM9PR03MB7186.eurprd03.prod.outlook.com (2603:10a6:20b:270::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 16:20:59 +0000
Received: from AS8PR03MB6775.eurprd03.prod.outlook.com
 ([fe80::8a03:2bdb:89c5:32e8]) by AS8PR03MB6775.eurprd03.prod.outlook.com
 ([fe80::8a03:2bdb:89c5:32e8%4]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 16:20:59 +0000
Date: Wed, 19 Feb 2025 17:20:52 +0100
From: Manuel Traut <manuel.traut@mt.com>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/5] rtc-rv8803: add tamper function to sysfs for
 rv8901
Message-ID: <Z7YE5NE1UWw52VMW@mt.com>
References: <20250116131532.471040-1-markus.burri@mt.com>
 <20250116131532.471040-4-markus.burri@mt.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116131532.471040-4-markus.burri@mt.com>
X-ClientProxiedBy: CH5PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:610:1f1::14) To AS8PR03MB6775.eurprd03.prod.outlook.com
 (2603:10a6:20b:29d::16)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB6775:EE_|AM9PR03MB7186:EE_
X-MS-Office365-Filtering-Correlation-Id: b8b1448d-8c24-4edf-978e-08dd51016540
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QQU3ywKalNFlYrN/wtQCksu861+XmcNt6ad+f1FAUxZS0O45dqKKOJN0VbW0?=
 =?us-ascii?Q?vwOo/2GTbjVETwhJ7kqrpAWU7gbLqRvdQ+t/DgeIGSobvSjA0huzWX2SMCUV?=
 =?us-ascii?Q?AIqDADglueNTETpSqrP+rbs3CPr810NtY1GMbrzBn59TIcZL2/z+8W1n2yx6?=
 =?us-ascii?Q?MafYSuOA4iWpabPTeuy4mPDuRxS+WG7fi4AtrbF6vmPBc/wymyltG/AZ9fsc?=
 =?us-ascii?Q?3lEZxh0Lc7y4r2cbvkVEGnpIChqAGT0gfuzEtoQvK3TXIlCWCUQ2KvYzdCbi?=
 =?us-ascii?Q?AuTXFHFFTU3N0Ii+F1lyblNwDNH2ZKMCx2rimIEFb6QYR2x4VDoNEBC2ljkQ?=
 =?us-ascii?Q?Uns8VYWTIs5ueenNUCGOCJJcUTTCFxseRh8qwKi/5aYxJqZvR9aLYvz637lu?=
 =?us-ascii?Q?az0takq04/XpnHJQDg4Lr1X9ZyBjAbhrNq3AaAlOSXqM9dEmkRFToQSfW6Zd?=
 =?us-ascii?Q?yyJ/rJf9qGLffp9EzMQ/NgvOfsww8eygdC0TxbpBbKsAxx1rv48k1ruk5Pte?=
 =?us-ascii?Q?bafMevc6zBcaomSTLAfFpnNxoi9E7CHAiwhx70LSBTxsKmxGo0usSPpn6b+p?=
 =?us-ascii?Q?TCJfGgXnuXdqu1fS7mwVLmYtf7hup407IvG4EmGZHKwSAfOk8q11US+M/iiy?=
 =?us-ascii?Q?Xr1zH9UFejJ9b0m9SX/4diAmLPG/okruuOLfs1ho2VPyP6Z4Tp7ER8JWF0WT?=
 =?us-ascii?Q?zWFtYsIkDoHFh4VXM8KhMEY7h3HvpFahDMKEDJDKOuJka3Tq9/2ZGMFxzlxg?=
 =?us-ascii?Q?u+88urmt17ZM71H/QnDezStMUpNSsQbJ0dhq5dtZzywW9qC1NVoHgGqkJnyM?=
 =?us-ascii?Q?EFraYi51nend2aNr47HIZSqWVPcpoyEfbKKjUeGQFOG9BAAXh29SYcB8J73u?=
 =?us-ascii?Q?JI+cpZO9EtVLtCPCBKY7G7etFbKVHM6PvdAUH/3zx7aww4ez7Jk048Aghu80?=
 =?us-ascii?Q?gjx543u6JFfRp48LMEupdGm4jmhZq/KdROPao+Jl+shJM0u3Q1d8LGTWydZM?=
 =?us-ascii?Q?QWjeVU085m9E9zF0WFyRhYL2FRGRNyifBm4utobOkIGFXgk0SILqq0Hai8PC?=
 =?us-ascii?Q?QsyQrDs4MFG/BYoAIFdVpb65hBakKDpLWyVE6bbT9+Py9ymlN6tLvxRydnb4?=
 =?us-ascii?Q?69N48lRZzAkUqV76jGIdBxXTLiypwxobjz7cbzMPdKh3U/hWuRiFVIMqmqOJ?=
 =?us-ascii?Q?o1OwmO9plitkFSK4py2ivLM9eBB8j3u59ANq49kHGlYG+GiSny2WhOnW2BQO?=
 =?us-ascii?Q?PEz/YYzKYoc22ak0FO2Q46XS5rtk+TkmmXO2027tSGR1f7AaXPHRnjk2gxpc?=
 =?us-ascii?Q?8wb7GhDE5xpR2WY40a0KlXnIltVA3waOIlTzHmEdyUEU42KHahpv15EkpfvA?=
 =?us-ascii?Q?WW5Um7xDpfO2yXx+l+iarPrvvE0V0iNdd9lHwSUcubwT4T5R0I9WCP1UWFHL?=
 =?us-ascii?Q?hJ43bs8CoBkWcYFVpbUn7XnHzIG2ThTa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB6775.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bRkDNJ0SSCQ3aAMIP3ROUsIQWpOy+3UxGbyY7LAtkk5NbU1LZp2ZSKU9Wu46?=
 =?us-ascii?Q?qYWmKU4jbrcQIaJZzVci0dsC+1etlhPzHG6fenTOUxqqn49BkQabh7OJRNkF?=
 =?us-ascii?Q?w4PgeXzR6nHy9ZPP3Zkv61xuqFSrxei6vIWf2l+V6HMXeSDiISEOAmEmQ3sU?=
 =?us-ascii?Q?REtpdFKXHOICwjzQHl5puiODRc5xExFfg5uaRy6mxHUxYif4syq3nlNfq4Uv?=
 =?us-ascii?Q?Eb/Mx1E6eGgTaXSbpC9dZ5BKN9JhBOggd4iwdnEo9WBPtVf2fvYF83MNuIq5?=
 =?us-ascii?Q?HrXsxHabkgfQMc0GOPC1Y5O1rRPjK6bFaPyih4iIOlVavvsN+QfMYmL8Zg75?=
 =?us-ascii?Q?skGgEjUKWtXepfPz9LZgbp82y5SgMw5Zs9+v5AKsyhi+sUP7boqT0id/ldyp?=
 =?us-ascii?Q?XXsdSVzoHhfys24pTLe8sp7WZWaeXHK7qC3CTnm2wvx4lgNUZ1zqZcO6xm7N?=
 =?us-ascii?Q?hfkzzjbwGWIoaYxKDJZlKj+SkYhTIKEHEZrZh6SAuZg5sBRsg/SaVvzZOKqj?=
 =?us-ascii?Q?8DGHU802WOKGs9YzEZm3ZlqRGFRZozzcoefR8gtHRi5CF/ekdqutLPZVkRy9?=
 =?us-ascii?Q?AzLTNKIk1RveMnFPYqA2CkqXVUPcOuCjAb+13NLD3cK4Bwr9ZI+Z74U/uUzJ?=
 =?us-ascii?Q?AXBhbD260CRJZgtYyDkZ8bZLQVNvjoUw39LwstWMhXQSbCiQVdJ6y8uUcyO0?=
 =?us-ascii?Q?PdP3qXpWZ5ZEZraRgWQDglke6SkH8wDazEgwJB1PM/XhuFfQuyBof1p0BFj+?=
 =?us-ascii?Q?QIjl99JB1wNGpn1m/vq28R+V5cMZ7ap9WreEBdHtsor9EdjH0917b2WOT4IT?=
 =?us-ascii?Q?ZTbeL/8BHt+iKs3h6Lr4m9FjUGdUQm8oALUlu5FfBjDb6xuoSmu6ZvbEuRh5?=
 =?us-ascii?Q?BXnk5pOnEKU60gqWWZKlWT1nteHbwqPDnZstJuO2A7NgGuHnezw2kUp/k3M7?=
 =?us-ascii?Q?yMMZCqgwsH+Na/Gkub62vIDE+n7fVOyIAk3ZJC4CNOsjwErE7HAM32GmvagK?=
 =?us-ascii?Q?ZxqAOa1oo7Mt2UmQEZbYu9tKFn/MEehcTiNYovaDq1L1oRmNekDiHnP3ucoP?=
 =?us-ascii?Q?WyE/uVzMswJmzuUUDoTsiii2FUEUUiLmszir3Q3mTAeLW+240RIa1Tpv76o7?=
 =?us-ascii?Q?5A4ZTqcs4mNiGJxRMKo/xpGqDPr5haQTSbSU1clgpSBNza/Y4SRJKt0p9HM2?=
 =?us-ascii?Q?54bDORYqSsDtS2s4N2KLCBmoGONdu9o/u23N2HSxXffjKlNSxTFftgY7Kqrz?=
 =?us-ascii?Q?SCGAnOsBsNSUvBlDgl7m4DF1xe8475DCnA/QkJpAZfcFXqgA0v5K+PyUCrYA?=
 =?us-ascii?Q?VVmKCYU2y+R4UlVoRvGF/CMnAJjYJ89dVm3QRY3pzJPUj/s7lWQQAfWaKXhO?=
 =?us-ascii?Q?uB6OnHwfP05TH6PHca0/uh2+oG6upZmGXJWZg8yX5ayUuIclpb1U1zJ9RwMN?=
 =?us-ascii?Q?OoQWLYxqMrWP60dMc7clYinbZHyIoQ7kigvEcgBsVWpEPg9wv3V7by6PhC8X?=
 =?us-ascii?Q?HlC8YAS3AK9hxVp6HHx+pCxYcF5+4diF29yiaWzOEbslq8CjanNAt24Pd9zG?=
 =?us-ascii?Q?kg9CeZNmNiKmgfagdIBAdrue0eFeDdQvWVB6kzCA?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8b1448d-8c24-4edf-978e-08dd51016540
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB6775.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 16:20:59.3459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EA2UitYqHR70pRk7updtOCrO4DUDcyezl861dJz/z5wWMjbm6wDD+YH5BkXnIfRwsRPiOJDhEOCyooDp99e04g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7186

On Thu, Jan 16, 2025 at 02:15:30PM +0100, Markus Burri wrote:
> Add sysfs interface to enable the EVINx pins and read the time-stamp
> events from EVINX.
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> ---
>  .../ABI/testing/sysfs-class-rtc-tamper        |  21 +
>  drivers/rtc/rtc-rv8803.c                      | 366 ++++++++++++++++++
>  2 files changed, 387 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-rtc-tamper
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-rtc-tamper b/Documentation/ABI/testing/sysfs-class-rtc-tamper
> new file mode 100644
> index 000000000..f035d0fa5
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-rtc-tamper
> @@ -0,0 +1,21 @@
> +What:		/sys/class/rtc/rtcX/tamper/enable
> +Date:		January 2025
> +KernelVersion:	6.13
> +Contact:	Markus Burri <markus.burri@mt.com>
> +Description:	(WO) Attribute to enable and disable the rtc tamper function.
> +		Write a '1' to enable tamper detection or a '0' to disable.
> +
> +What:		/sys/class/rtc/rtcX/tamper/read
> +Date:		January 2025
> +KernelVersion:	6.13
> +Contact:	Markus Burri <markus.burri@mt.com>
> +Description:	(RO) Attribute to read the stored timestamps form buffer FIFO.

Description:	(RO) Attribute to read tamper events.

> +		The timestamps are returned one by one

        Each read tries to retrieve a single entry from the hardware
        FIFO. Events that are not retrieved stay in the hardware FIFO.

> +		Format is 'seconds.milliseconds' since the epoch followed by the trigger events.
> +		The value of the event is the current pin value.
> +
> +		Example values:
> +		- "1234.567 EVIN1=1" for a trigger from EVIN1 changed from low to high
> +		- "1234.567 EVIN1=0 EVIN2=1 for a simultaneous trigger of EVIN1 changed to low and
> +		  EVIN2 changed to high.
> +
> diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
> index 50fbae931..764e654c2 100644
> --- a/drivers/rtc/rtc-rv8803.c
> +++ b/drivers/rtc/rtc-rv8803.c
> @@ -10,6 +10,7 @@
>  #include <linux/bcd.h>
>  #include <linux/bitops.h>
>  #include <linux/bitfield.h>
> +#include <linux/delay.h>
>  #include <linux/log2.h>
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
> @@ -58,6 +59,35 @@
>  #define RX8900_FLAG_SWOFF		BIT(2)
>  #define RX8900_FLAG_VDETOFF		BIT(3)
>  
> +#define RX8901_EVIN_EN			0x20
> +#define RX8901_EVIN1_CFG		0x21
> +#define RX8901_EVIN2_CFG		0x23
> +#define RX8901_EVIN3_CFG		0x25
> +#define RX8901_EVENTx_CFG_POL		GENMASK(1, 0)
> +#define RX8901_EVENTx_CFG_PUPD		GENMASK(4, 2)
> +
> +#define RX8901_EVIN1_FLT		0x22
> +#define RX8901_EVIN2_FLT		0x24
> +#define RX8901_EVIN3_FLT		0x26
> +
> +#define RX8901_BUF1_CFG1		0x27
> +
> +#define RX8901_BUF1_STAT		0x28
> +#define RX8901_BUFx_STAT_PTR		GENMASK(5, 0)
> +#define RX8901_WRCMD_CFG		0x41
> +#define RX8901_WRCMD_TRG		0x42
> +
> +#define RX8901_EVNT_INTE		0x43
> +
> +#define RX8901_BUF_INTF			0x46
> +#define RX8901_BUF_INTF_BUF1F		BIT(5)
> +
> +#define RX8901_EVNT_INTF		0x47
> +
> +#define NO_OF_EVIN			3
> +
> +#define EVIN_FILTER_MAX			40
> +
>  enum rv8803_type {
>  	rv_8803,
>  	rx_8803,
> @@ -66,6 +96,50 @@ enum rv8803_type {
>  	rx_8901,
>  };
>  
> +enum evin_pull_resistor {
> +	no = 0b000,
> +	pull_up_500k = 0b001,
> +	pull_up_1M = 0b010,
> +	pull_up_10M = 0b011,
> +	pull_down_500k = 0b100,
> +};
> +
> +enum evin_trigger {
> +	falling_edge = 0b00,
> +	rising_edge = 0b01,
> +	both_edges = 0b10,
> +};
> +
> +struct cfg_val_txt {
> +	char *txt;
> +	u8 val;
> +	bool hide;
> +};
> +
> +static const struct cfg_val_txt trg_status_txt[] = {
> +	{ "EVIN1", BIT(5) },
> +	{ "EVIN2", BIT(6) },
> +	{ "EVIN3", BIT(7) },
> +	{ "CMD", BIT(4) },
> +	{ "VBATL", BIT(3) },
> +	{ "VTMPL", BIT(2) },
> +	{ "VDDL", BIT(1) },
> +	{ "OSCSTP", BIT(0) },
> +	{ NULL }
> +};
> +
> +static const u8 evin_cfg_regs[] = {
> +	RX8901_EVIN1_CFG,
> +	RX8901_EVIN2_CFG,
> +	RX8901_EVIN3_CFG
> +};
> +
> +static const u8 evin_flt_regs[] = {
> +	RX8901_EVIN1_FLT,
> +	RX8901_EVIN2_FLT,
> +	RX8901_EVIN3_FLT
> +};
> +
>  struct rv8803_data {
>  	struct i2c_client *client;
>  	struct rtc_device *rtc;
> @@ -558,6 +632,292 @@ static int rv8803_nvram_read(void *priv, unsigned int offset,
>  	return 0;
>  }
>  
> +static int rv8803_ts_event_write_evin(int evin, struct rv8803_data *rv8803,
> +				      enum evin_pull_resistor pullup_down,
> +				      enum evin_trigger trigger, int filter)
> +{
> +	int ret;
>
> +	u8 reg_mask;
> +	struct i2c_client *client = rv8803->client;
> +
> +	/* according to data-sheet, "1" is not valid for filter */
> +	if (evin >= NO_OF_EVIN || filter == 1 || filter > EVIN_FILTER_MAX)
> +		return -EINVAL;
> +
> +	guard(mutex)(&rv8803->flags_lock);
> +
> +	/* set EVENTx pull-up edge trigger */
> +	ret = rv8803_read_reg(client, evin_cfg_regs[evin]);
> +	if (ret < 0)
> +		return ret;
> +	reg_mask = ret;
> +	reg_mask &= ~(RX8901_EVENTx_CFG_PUPD | RX8901_EVENTx_CFG_POL);
> +	reg_mask |= FIELD_PREP(RX8901_EVENTx_CFG_PUPD, pullup_down);
> +	reg_mask |= FIELD_PREP(RX8901_EVENTx_CFG_POL, trigger);
> +	ret = rv8803_write_reg(client, evin_cfg_regs[evin], reg_mask);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* set EVENTx noise filter */
> +	if (filter != -1) {
> +		ret = rv8803_write_reg(client, evin_flt_regs[evin], filter);

> +		if (ret < 0)
> +			return ret;
This check is not needed.

> +	}
> +
> +	return 0;
    return ret;
> +}
> +
> +static int rv8803_ts_enable_events(struct rv8803_data *rv8803, u8 enable_mask)
> +{
> +	int ret;
> +	u8 reg_mask;
> +	struct i2c_client *client = rv8803->client;
> +
> +	guard(mutex)(&rv8803->flags_lock);
> +
> +	/* event detection interrupt */
> +	ret = rv8803_read_reg(client, RV8803_CTRL);
> +	if (ret < 0)
> +		return ret;
> +
> +	reg_mask = ret & ~RV8803_CTRL_EIE;
> +	if (enable_mask)
> +		reg_mask |= RV8803_CTRL_EIE;
> +
> +	ret = rv8803_write_reg(client, RV8803_CTRL, reg_mask);
> +	if (ret)
> +		return ret;
> +
> +	/* events for configuration */
> +	ret = rv8803_write_reg(client, RX8901_EVIN_EN, enable_mask);


> +	if (ret < 0)
> +		return ret;

Not needed

> +	return 0;

    return ret;

> +}
> +
> +static ssize_t enable_store(struct device *dev, struct device_attribute *attr, const char *buf,
> +			    size_t count)
> +{
> +	int ret;

> +	int i;
can be declared in the scope of the for loop

> +	unsigned long tmo;
> +	u8 reg;
> +	u8 reg_mask;
> +	struct rv8803_data *rv8803 = dev_get_drvdata(dev->parent);
> +	struct i2c_client *client = rv8803->client;
> +
> +	/* EVINxCPEN | EVINxEN */;
> +	const u8 reg_mask_evin_en = GENMASK(5, 3) | GENMASK(2, 0);
> +
> +	bool enable = (strstr(buf, "1") == buf) ? true : false;
> +
> +	/* check if event detection status match requested mode */
> +	ret = rv8803_read_reg(client, RX8901_EVIN_EN);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* requested mode match current state -> nothing to do */
> +	if (ret == (enable ? reg_mask_evin_en : 0))
> +		return count;
> +
> +	dev_info(&client->dev, "%s time-stamp event detection\n",
> +		 (enable) ? "configure" : "disable");

dev_dbg

> +	/*
> +	 * 1. disable event detection interrupt
> +	 * 2. disable events for configuration
> +	 */
> +	ret = rv8803_ts_enable_events(rv8803, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* for disable no configuration is needed */
> +	if (!enable)
> +		return count;
> +
> +	/* 3. set EVENTx pull-up edge trigger and noise filter */
> +	for (i = 0; i < NO_OF_EVIN; ++i) {

	for (int i = 0; i < NO_OF_EVIN; ++i) {

> +		ret = rv8803_ts_event_write_evin(i, rv8803, pull_up_1M, falling_edge, 0);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	scoped_guard(mutex, &rv8803->flags_lock) {
> +		/* 4. enable EVENTx interrupt */
> +		ret = rv8803_read_reg(client, RX8901_EVNT_INTE);
> +		if (ret < 0)
> +			return ret;
> +		reg_mask = BIT(5) | BIT(6) | BIT(7); /* EVINxIEN 1-3 */
> +		reg = (ret & ~reg_mask) | reg_mask;
> +		ret = rv8803_write_reg(client, RX8901_EVNT_INTE, reg);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	/*
> +	 * 5. set BUF1 inhibit and interrupt every 1 event
> +	 *    NOTE: BUF2-3 are not used in FIFO-mode
> +	 */
> +	ret = rv8803_write_reg(client, RX8901_BUF1_CFG1, 0x01);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* 6. clean and init for BUFx and event counter 1-3 and trigger cmd */
> +	reg = BIT(7) | GENMASK(6, 4);
> +	reg |= BIT(0); /* CMDTRGEN */
> +	ret = rv8803_write_reg(client, RX8901_WRCMD_CFG, reg);
> +	if (ret < 0)
> +		return ret;
> +	ret = rv8803_write_reg(client, RX8901_WRCMD_TRG, 0xFF);
> +	if (ret < 0)
> +		return ret;
> +	tmo = jiffies + msecs_to_jiffies(100); /* timeout 100ms */
> +	do {
> +		usleep_range(10, 2000);
> +		ret = rv8803_read_reg(client, RX8901_WRCMD_TRG);
> +		if (ret < 0)
> +			return ret;
> +		if (time_after(jiffies, tmo))
> +			return -EBUSY;
> +	} while (ret);
> +
> +	/*
> +	 * 7. enable event detection interrupt
> +	 * 8. / 10. enable events for configuration in FIFO mode
> +	 */
> +	ret = rv8803_ts_enable_events(rv8803, reg_mask_evin_en);
> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t read_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	int ret;
> +	int ev_idx;
> +	int num_events;
> +	unsigned long long time_s;
> +	int time_ms;
> +	int offset = 0;
> +	u8 reg_mask;
> +	u8 data[10];
> +	struct rtc_time tm;
> +
> +	struct i2c_client *client = to_i2c_client(dev->parent);
> +	struct rv8803_data *rv8803 = dev_get_drvdata(dev->parent);
> +
> +	guard(mutex)(&rv8803->flags_lock);
> +
> +	/*
> +	 * For detailed description see datasheet:
> +	 *  - Reading Time Stamp Data (FIFO mode)
> +	 */
> +
> +	/* check interrupt source is from event 1-3 */
> +	ret = rv8803_read_reg(client, RX8901_EVNT_INTF);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* CHECK for EVF bit */
> +	if (ret & BIT(2)) {
> +		/* clear EVINxF 1-3 */
> +		reg_mask = BIT(5) | BIT(6) | BIT(7);
> +		ret = rv8803_write_reg(client, RX8901_EVNT_INTF, ret & ~reg_mask);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	/* check interrupt source is from event 1-3 */
> +	ret = rv8803_read_reg(client, RX8901_BUF_INTF);
> +	if (ret < 0)
> +		return ret;
> +	if (ret & RX8901_BUF_INTF_BUF1F) {
> +		/* disable interrupts */
> +		ret = rv8803_read_reg(client, RV8803_CTRL);
> +		if (ret < 0)
> +			return ret;
> +		ret = rv8803_write_reg(client, RV8803_CTRL, ret & ~RV8803_CTRL_EIE);
> +		if (ret < 0)
> +			return ret;
> +
> +		/* clear interrupt flag */
> +		ret = rv8803_read_reg(client, RX8901_BUF_INTF);
> +		if (ret < 0)
> +			return ret;
> +		ret = rv8803_write_reg(client, RX8901_BUF_INTF, ret & ~RX8901_BUF_INTF_BUF1F);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	/* test if there are events available */
> +	ret = rv8803_read_reg(client, RX8901_BUF1_STAT);
> +	if (ret < 0)
> +		return ret;
> +	num_events = ret & RX8901_BUFx_STAT_PTR;
> +
> +	if (num_events) {

    if (!num_events)
        goto exit_reenable_irq;

would be better readable.

> +		ret = rv8803_read_regs(client, 0x60, ARRAY_SIZE(data), data);
> +		if (ret < 0)
> +			return ret;
> +
> +		tm.tm_sec = bcd2bin(data[2]);
> +		tm.tm_min = bcd2bin(data[3]);
> +		tm.tm_hour = bcd2bin(data[4]);
> +		tm.tm_mday = bcd2bin(data[5]);
> +		tm.tm_mon = bcd2bin(data[6]) - 1;
> +		tm.tm_year = bcd2bin(data[7]) + 100;
> +		tm.tm_wday = -1;
> +		tm.tm_yday = -1;
> +		tm.tm_isdst = -1;
> +
> +		ret = rtc_valid_tm(&tm);
> +		if (ret)
> +			return ret;
> +
> +		/* calculate 1/1024 -> ms */
> +		time_ms = (1000 * ((data[1] << 2) | (data[0] >> 6))) / 1024;
> +		time_s = rtc_tm_to_time64(&tm);
> +
> +		offset += snprintf(buf + offset, PAGE_SIZE - offset, "%llu.%03d", time_s, time_ms);
> +		for (ev_idx = 0; trg_status_txt[ev_idx].txt; ++ev_idx)
> +			if (data[9] & trg_status_txt[ev_idx].val)
> +				offset += snprintf(buf + offset, PAGE_SIZE - offset, " %s=%d",
> +						   trg_status_txt[ev_idx].txt,
> +						   !!(trg_status_txt[ev_idx].val & data[8]));
> +		offset += snprintf(buf + offset, PAGE_SIZE - offset, "\n");
> +
> +		/* according to the datasheet we have to wait for 1ms */

Is it fine that interrupts are disabled that long?

> +		usleep_range(1000, 2000);
> +	}
> +

exit_reenable_irq:

> +	/* re-enable interrupts */
> +	ret = rv8803_read_reg(client, RV8803_CTRL);

Is it fine, that interrupts are only enabled again, if all of the above code
doesn't return with a failure?

> +	if (ret < 0)
> +		return ret;
> +	ret = rv8803_write_reg(client, RV8803_CTRL, ret | RV8803_CTRL_EIE);
> +	if (ret < 0)
> +		return ret;
> +
> +	return offset;
> +}
> +
> +static DEVICE_ATTR_WO(enable);
> +static DEVICE_ATTR_RO(read);
> +
> +static struct attribute *rv8803_rtc_event_attrs[] = {
> +	&dev_attr_enable.attr,
> +	&dev_attr_read.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group rv8803_rtc_sysfs_event_files = {
> +	.name = "tamper",
> +	.attrs	= rv8803_rtc_event_attrs,
> +};
> +
>  static const struct rtc_class_ops rv8803_rtc_ops = {
>  	.read_time = rv8803_get_time,
>  	.set_time = rv8803_set_time,
> @@ -732,6 +1092,12 @@ static int rv8803_probe(struct i2c_client *client)
>  	if (err)
>  		return err;
>  
> +	if (rv8803->type == rx_8901) {
> +		err = rtc_add_group(rv8803->rtc, &rv8803_rtc_sysfs_event_files);
> +		if (err)
> +			return err;
> +	}
> +
>  	rv8803->rtc->ops = &rv8803_rtc_ops;
>  	rv8803->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
>  	rv8803->rtc->range_max = RTC_TIMESTAMP_END_2099;
> -- 
> 2.39.5
> 


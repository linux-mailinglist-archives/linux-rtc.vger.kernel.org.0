Return-Path: <linux-rtc+bounces-6419-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BvSBiLj7GmNdQAAu9opvQ
	(envelope-from <linux-rtc+bounces-6419-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Apr 2026 17:52:02 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B575466CC4
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Apr 2026 17:52:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53B413012EB6
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Apr 2026 15:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A496C34DB6D;
	Sat, 25 Apr 2026 15:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="g5x022Y2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010068.outbound.protection.outlook.com [52.101.229.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D6D3112AD;
	Sat, 25 Apr 2026 15:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777132307; cv=fail; b=BKZWUmb6QH+ZHq5eZAdJTNZVVm/CuMgCHVP9QKyO/dgNfoly3YHUTpbm9r8cYTh5vcJ9N2NJv6taCwPwkewKtuqebJxaHBA1iSIA3EXLhcZGt5NAgf8BsNWwmEpnS4CMn5iLieP8FIrnUdYAH0GfOjDgxZQ2NY4tM5mE2opA2y0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777132307; c=relaxed/simple;
	bh=xCjgyJaROa9rFxsAwDve1Jb+mf9q3T3tuAdejYJQeUk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=DULYZWhcJkk3k6yzIkXsuwjtNaEo608tNFu0JB3at8s257xMLuV39lNEZkl40SG5r+a84fyMqsAKmTBYEobLaP4iVrgEV5kyzultyyZJEjVwHvtXENjnkvWuNfvosUsbPai+k26oc1C6gLbteof5kwuiN6aTzRFH4bAOcm2S9Qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=g5x022Y2; arc=fail smtp.client-ip=52.101.229.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UucmQ4ryoWz4vvw7ual0bn7sVq3k5dJCNj98IdNaY+VuJTy9eBtUoLxt6iivAL2xECoVehkmZBsYW2SUvDddKJsljIw3IvMi/gib+SIpn8pYzVypt9Df6xun3TyzhclFCrQdHiJXKQp4gz+ES35EeRSNjaDfhXDcWS1lNhHc/dVMyzmOrgqItL7A75QRLTwP9vwxz+EBSiJ+icX5MBwOZMEd8plEUKMbSTl2dbToQjq8LnSEQr6NDn/0f3hV/5rlGkGWfRIsfhMLc6pVEH0FwD6y9u70fYGwbWcRq/8eHrdfzY+bvEiFwDYvmHvDJo61iiuS/xUj7j8han8TM+Db7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4+gstEOCMpglAWoyDNLOhtnPi3nPDv6AQrPYn/UluY=;
 b=RIJD8KzhfJg2E1/aP/0cwszTmD+ff/KBRwuVgTzjG2hKoi1wkZpbQOziXwVDwytmiMK3iER7M5JImqfwwbGvMPqgWog1d7fvGoIgTvFKdZK5AaofPQlwqtRm6hZnk1mI8zXcOLAky/C0d0HTUYazHkG4dUY9yqQ8rhajNHpllqieSYwj4VKgO0TUcpERxGirMgmMZXJlVnKs7ZTCPVacVqmNCqFkkyvJjWjoP4/oPMiJt+QG62+Z+FA0ljALZV4B6+jOsn1xrtjrK9HhGYlS0JFrQU31tkyW5Lx+AQJDR8vzhg55tgB3FvgbQYd4/Y4bHMGtY7SglUOy57h2ZHgXyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4+gstEOCMpglAWoyDNLOhtnPi3nPDv6AQrPYn/UluY=;
 b=g5x022Y2O/BKO4SwaLuvr6wTgdVhb9cqKsjgSsLXe3KPG9gBWSEkhgwrCrJELrRDGOL6CtkkvlUyoLlZ3c8Yo7jidrzUnrEoSD1ZWdax3ViWrvAaHTBHHB2VQWQNJTVExDIknmzQhyEKJE5ZrxgOsX6ossy611O0pfhypzug/CU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYCPR01MB7315.jpnprd01.prod.outlook.com (2603:1096:400:f1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.24; Sat, 25 Apr
 2026 15:51:41 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9846.022; Sat, 25 Apr 2026
 15:51:36 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: alexandre.belloni@bootlin.com
Cc: ryan@bluewatersys.com,
	akpm@linux-foundation.org,
	m.grzeschik@pengutronix.de,
	Denis.Osterland@diehl.com,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	john.madieu@gmail.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH 0/2] rtc: isl1208: Fix IRQ return value and wake reference leak
Date: Sat, 25 Apr 2026 15:49:57 +0000
Message-Id: <20260425154959.2796261-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0117.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34c::20) To OS7PR01MB17371.jpnprd01.prod.outlook.com
 (2603:1096:604:43e::6)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|TYCPR01MB7315:EE_
X-MS-Office365-Filtering-Correlation-Id: ff231ea2-1982-46eb-7fcb-08dea2e2865e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	RpyupfRRHjG1s9q6c71SI1baGTEV1uscCxGag8+dAInxC5TgLziJ2ouyuaPwFUWBUvBQsqCcesUrrJFBKfrVobpzVIoMOBtWttrbp1QGvucq5A2kgJM5n/mVuG7t0x/qF1qSjyQ0Hz8/8pJcfuD+DCGEfudkKxcnWUBnrylPWzMxNaQHxPYthvWrNRHRtZ9u4a2e3DXOG2gqOvSxN0f/rCLwMXKPAfQpB9lIWtvmn6bfze93QrHyMt6P/WzNibC12UO3FTqzhFyOh5n6HaktZmIm23A7p0SBIbTjvWeE5Q0WMLBpCmFwF2GWlVbrs4CHf1y748Si9xoZh2lAkqSMT2ljKnAEjw2zNcfYwbmtLQSN+x2XckeN93zdvJbnhlMyV0LR+EfyynZQNzqLP/TCayg7DmehVVjBHqyu452xkO7w110j+eJGOWjwnGDJopbVwwEQ1E9wtp+nbYGUHxZ2h+ORbWJfdBaMDfitiQy0uHNsl+vQJWb+MEUfdSSl25wax9T+vaH8IhLopy7jY6W86Sb99laOTjjiY7zGiFEdH71zOa7fd0bIsTYUMdVx3tB0q4aqtuwtfpJQNF0XXzaI8m8uia1nAnq7fpPms3jwmbamcfbaIrnkk2PuaOpT3pMyC+1PcxWqy4jLwlJGA3LwEcQD/oo56TTg4eTSo+9p/WcWtRxxK7rH10zfqo8k+k1ZuiQvG/ePnHnp3d3T3hD1QorRyqi67PBQVEUjusMGdh3PzDCQfRPUC+h1ck5TxaxFDJJ1rYQpGKczPmyJRPXndxexxltJWhQ2Q0/SjW/Pudg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZLo5J0xw03wHoo5H1eZd7+NVQKTJ9IC6zhQmHTqEoQH2PKiuGd+dIM1LUVIL?=
 =?us-ascii?Q?mCSLV8zSQtlUZ38dGzqN46+SxHRpqRwQ0kS/qT1liOQWuN+cE/IXnPhygDvh?=
 =?us-ascii?Q?XNcIPLO9Edwx5nQ+OPdrKliYL2CHwPFbkHeQqtHSZDIx0qL+xouLfhQh9yry?=
 =?us-ascii?Q?AzXXF+hx7pHAmE9ZLrIoTmF3gsdW3o9+Bs2WO6LdzrJUuoLlLEvUHhWbUWY2?=
 =?us-ascii?Q?fmj/L2Z04JTg0T6ucAzkAXqE0H918Ag+gmKjb0QD+4Rt07XD3kAlFganCNvN?=
 =?us-ascii?Q?eLGYwaJGhYgJrwIV/npggN08ZtyH/yXWGwNhR9w3FVARg7bddvGoLavbwHy5?=
 =?us-ascii?Q?N9zjLewJAJLjYLVcPPg+6tKzqNlXrk9FMVVXwEIj2kBLQpxtIOxivtVcSKYv?=
 =?us-ascii?Q?bc/0GuGR/t+KEPkx6IUa7KBuIIq36NrYA+H9BfJurnikYo4mAEk2pZBz1Px4?=
 =?us-ascii?Q?FDTDT9CTKq9tloaIc3PU0xgR0DUfJmhcMFIfOVbyIBTbH9v14Rl+b5DsbsBg?=
 =?us-ascii?Q?XACD9FdK+hlk4B5eYZNTFtMopdch7uZPSNYYa/al+c7mSVHctX/g53+02BZY?=
 =?us-ascii?Q?NeEAI+pFbGkWK+A/SdF7qJ6JRp+shj51yvdJLqwiw1Ib7i0n8gvpDsyEvYjA?=
 =?us-ascii?Q?5DkqvFUSJm3Wq6Wwb6Ks1C5s5t/LoGTmvuuAABezmzXq4rMFsaMUrmYaLA6L?=
 =?us-ascii?Q?cAbruVNu2j6TnfsDZCKyxFo3BLUmxa+Qgz6B9ajOHjmtF27IJx2H0yZgH4JK?=
 =?us-ascii?Q?MxRKylqz3q0za6Unxe4JOvEK1lSHcpnGrPPYYy0Xdx+J/OQsytzq6JCjpqaa?=
 =?us-ascii?Q?fMbqY6sBVdFW2Q8lhfodaAKLqPecSnras6MjHpiii0RjOpRKoWGXP98BO8Wp?=
 =?us-ascii?Q?8eBgQKjCXqUDG2uc4/cQqZZoyLC+VH252K625TNMXOL20qSYLdbRfuGv+FPH?=
 =?us-ascii?Q?YGR579ahg/MBqjoPXL0AAyVvPnJe0QCliYRwkTprQgfIJ9YKgJyqpphl3+gk?=
 =?us-ascii?Q?3tn5v7sw/TGWspyBOiFU6RFnp6f42ZLHOUbmV/bgsZe628jMwvZMieKsg0j5?=
 =?us-ascii?Q?cWSCvWTBd7hhB4igQ8QajCiVZB9TtBemobimjSc7QVV9EPIkstdRo9CfUX6k?=
 =?us-ascii?Q?Px1uuERJreYomMDvl220GWFtQlf511nwT35nc+DpiW7h0PoXebV4yQvxsO/W?=
 =?us-ascii?Q?DREwOtKTPRad4mKipUXiK0IIHG6u0TDypcjER4Ue1/bZNizMdlTA5PhZhT5X?=
 =?us-ascii?Q?lPl2MKtY7VU4gEDWEEVqJAbcxvEHwPJFhK38TjIK6tdKZdy/sCR+dUiTgGNd?=
 =?us-ascii?Q?7AtwirSBKvIcPwo5U9/tln8DGQXnBaTKr4TOw5dIkS+kBr6JZ+FaMatmm4kM?=
 =?us-ascii?Q?oNgROAxkzkKBvhboiJH088KqY9wFdNaLtEwtZz8b/RO0GvOQPt/J+iV0M/JC?=
 =?us-ascii?Q?HrmgClkzc36fDMrasF09fxunRbAgsJDzxEwkiAvqW1C4vKs5IU5nP8d1ke+S?=
 =?us-ascii?Q?XeyEpdavi9YelbEvkE9qKsSu0gt9P2Gicbk2XeUXqrEqYiLsp7kJDWDdjgbc?=
 =?us-ascii?Q?JKnasvaq+8buj8iT9D0dF26ZW7P4HCxRsk+4SarYXUNeNuRBmsCe58OiWgsz?=
 =?us-ascii?Q?TEj3iDKjzUnG72frNoBbnYtZxAlZyqUQV3vOlU/eZl5/XIpZ6M4v74yBn/se?=
 =?us-ascii?Q?LACzpNtt4DQUdrICq5/Ye7ayAVfyHM51ffXpUKEqRfgLy73CVaOMPhRzVVqx?=
 =?us-ascii?Q?1WIWs/nTxj5x4H8+kK43Yw0gnJS35pw=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff231ea2-1982-46eb-7fcb-08dea2e2865e
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB17371.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2026 15:51:36.7464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Mrqut9jFtDjnp/2bOawO9K2UMWMcX9xKpJ2sm5OmkaZMGGol0tO2B+l8eDxPM0vBssi3sl+iR+JuE0S8PYYR7xAI5E1ilgA0y1RcnBPxAY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7315
X-Rspamd-Queue-Id: 6B575466CC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bluewatersys.com,linux-foundation.org,pengutronix.de,diehl.com,vger.kernel.org,bp.renesas.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-6419-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi all,

This series fixes two issues in rtc-isl1208. The first is
isl1208_rtc_interrupt() returning negative i2c errnos where
irqreturn_t is expected, which genirq flags as bogus and logs
on each IRQ. The second is a wake-reference leak: setup_irq()
calls enable_irq_wake() on success but the driver has no remove
path that balances it, so each rebind cycle leaks one wake
reference per IRQ.

John Madieu (2):
  rtc: isl1208: Fix returning errno as irqreturn_t in IRQ handler
  rtc: isl1208: Balance enable_irq_wake() with disable_irq_wake() on
    cleanup

 drivers/rtc/rtc-isl1208.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

-- 
2.25.1



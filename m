Return-Path: <linux-rtc+bounces-1674-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F45C9598C6
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Aug 2024 13:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43C491C21935
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Aug 2024 11:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A2A31EC0CC;
	Wed, 21 Aug 2024 09:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="QlsaPG6s"
X-Original-To: linux-rtc@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2083.outbound.protection.outlook.com [40.107.215.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712C01EC0A6;
	Wed, 21 Aug 2024 09:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724232542; cv=fail; b=MR0lO0QO97fQte4oFntQcqf8ECTUQS6ybhB6ScFA/BML3+6NgUP3LN6q40mHykKtSj1S9CQhvKPxqaBS+HVGZk7jHA+j360pr31HmVqqvXpgSf+BEMCkpdNCNnU4fm2zqB9GFvZw+wb/kRNUy/bmJ1AsvUB1zZUyV68Z7gJgaXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724232542; c=relaxed/simple;
	bh=xxb+pFHSDXnFwFyKL5pNsjtRK9N1guED+XRONGy+PXY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=D1Aiex9AUBm4OiF3LeiOxQHmRUq/TbvfM3HQ59u3HxmBtng+625/VTPAFqgpwLZccvD9vzr/KwyZwmG87ggFUsurLSd1dQQ+ZoiBaA8gPgYwCHAJ8v1VicLRcVVQb7zFDr9RZ1oFzmQC4c0jf1S29dQWbTu2pB0UA4q+Bxw1bYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=QlsaPG6s; arc=fail smtp.client-ip=40.107.215.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+Escp9V+AFlzZujy0bLaWAep+uwL5MWLacLTBJ1oCL8JGrsZY3Y3+VlPZb5EBrzOKSSfzMrllj9BawBi0MZ1eXNWFMSlVQFYXVacXTlaan6n+xmmCVsnY7PiljLbTvwENpGXDzWxEz6Xbj03PxuSqR6STl4i7L27xHrEu5dkGrZJh7TNvQWReb0/tDeNMP5C+Uf4cVpYCcqwSLk6q+BxLGLe52cO8VWkUXkxNwL8GKK9j9MMrFN05FaveoaOh5OP+pJvLUFX7/MS+uPA4gZZjDW13l8ePRu70Cwf8uYk/xjC6xkeMp3WWrjgolw8G+qc/ma91KME4pfWuii+HMKeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4njFXAHePQuR9GtXkXlGMjQA0mPx6kOVTvFk67UzQHE=;
 b=TLPYDIZ/tKy8sxjyQzPYS+tvDINX3Xv94xQ1BAV5GvqbTtUdyQvYZUEBQHcmMtGeyZbzVM6AjsIhoFJs6PuuRILseUYUrGb/VALEcHjO6FL6SSG4Yy4WhoBXe4q75LcJBLkePeP4rDuDW61yTGMFhEPcvFMyLPhBv0frILQfsklcNNSCUhvLkfx54zCTxYNe0e6qZluYfeKOKG8TkwIJShRF8DkdyI7LHX/a4cWIx0tMolyGfKwKGHk5iWXP1Fpyz6oBYWnzbnn5iNS6sWc1bLb9q9ZyXeBwpNNGdjsJA1ja+vwgwCIPlyXeDU1vOGpSgumWQfa/77JEyrIp5KzIHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4njFXAHePQuR9GtXkXlGMjQA0mPx6kOVTvFk67UzQHE=;
 b=QlsaPG6sCyZ26jCkaSXnURU/OWW5CV1j/nk3vE6AEBzbvhAXKai2xgL6WdR58zLru/+9uMoom0N0n+3MpCWVpAKWjNtk2+npTPJL8ZHB2tlG1XItTxv5H5wfTJ/HzYOGUspFmvOoeLQrJqxKru1N9lnZvGN6gJ++dfN5V9PFURMyhSAnorUmh1HBbHDSqQeDe4HRgmfJyeJmDm64YQ2HfIGtxTYKPrOeo/xDAly7QpveHiPc7ZaBiTqT9FYmFeyhGtdaFnF95NElyePigES4RiiytbGF9yb77p965iLh3+8WYaiut0M4NB0JwnYZXt0oirz5xCYiJgWqDgR6xpJBKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by JH0PR06MB7199.apcprd06.prod.outlook.com (2603:1096:990:99::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.22; Wed, 21 Aug
 2024 09:28:55 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.7875.023; Wed, 21 Aug 2024
 09:28:55 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: alexandre.belloni@bootlin.com,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH 0/7] rtc:Use devm_clk_get_enabled() helpers
Date: Wed, 21 Aug 2024 17:28:39 +0800
Message-Id: <20240821092846.20138-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0001.jpnprd01.prod.outlook.com (2603:1096:405::13)
 To SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|JH0PR06MB7199:EE_
X-MS-Office365-Filtering-Correlation-Id: 47020eb7-a571-495c-2411-08dcc1c3ad46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qNQ4kHeFXmMx4wY+SWsCthuYHWZ3QOubpSXdmrbX858SqV+7s2mJmsGLNCRN?=
 =?us-ascii?Q?P5A9/AkGK9l9N/SiB4t4PZ0iNhoWA4we7rPpJGgOmc3uzlYrHh4KreBePUty?=
 =?us-ascii?Q?jArGwmSx18NDwaegh4yBtPdgjy5g4rm9riWm54tccj31+2RSvWUasMBIFRCS?=
 =?us-ascii?Q?n/QO83n2A8nIGgGaXLAFnggZ7Cn8IdN9YmDE6udBSr9vMdggBxG49zPcO/ut?=
 =?us-ascii?Q?xuAI/W2jO2FlF5/qytWMjUstRsCK5Sglef/odzeVB+f3WqombGPyPvvGnZG7?=
 =?us-ascii?Q?6bD46yIfgl0m2I88j7Wfkv91pZvwkgCgYfSF82n8+lw5Og5Rp4BTAEdJUiGR?=
 =?us-ascii?Q?U+/IhCgudhmdKinygAeuD2b6vj1+5CL7R6BVW204EnshbhNLC6r7sekSMkGB?=
 =?us-ascii?Q?Fhwms4tm1N4S9FdXXu7WiTk/3jJ15W+rcyQnUIm7sphMargKLofoDRbft8le?=
 =?us-ascii?Q?+CxykGGK1lcOtFNx8ssfL+t/f1ZXFfuM+9B0EtNubMGuZ9dqHZKzsBZDbbtZ?=
 =?us-ascii?Q?banFxUZqFi5dUHpQLeEPY3vr79HVsU03Dx9QP8rO+0SB/ANtG+rxa96KnEoR?=
 =?us-ascii?Q?O8lkB9UekY3rIvRcJCOxHKA3Tv0mGH5bcGI0Lce0C5EiKYII8E4iBTBBnlf5?=
 =?us-ascii?Q?ToPEXCxDCxbAAKxJdG0U0DxdvxKy/obdeFtEKZtylv1mUL6hIPEYIG0O47xr?=
 =?us-ascii?Q?mMJxEJt3wxO7ylThu9KFH5zD75H/0MyokXCxhH6Z4HokvVCaELczY3pfHdRD?=
 =?us-ascii?Q?T5nKsjdT7Tw4gelORuW+PsT01lYNdax4bu+pEJL4wBf2FMm/+oo+3Flvzj5x?=
 =?us-ascii?Q?KbFx4Vx7ICijzBrepV97d6SlSSIEfv26KEc0ds92OR+n73Z3A+AO4WtaXQTp?=
 =?us-ascii?Q?gpTp36dwyMI7+XOQiTtqttFXYnV1qKoT5i29hmFr13QvboqUW5uPRNgNLs+/?=
 =?us-ascii?Q?VI7LOAB1JegvupgiRDzgGxbBcU1qRkIUkf/Wbqjy8exbjlx4q3SmkzjWNYPx?=
 =?us-ascii?Q?ZLM2QYLqjArLTU/Yljyd+dEnKgpSbaGsBEdDtgnZx6LLVxNyPeBd4mQaejde?=
 =?us-ascii?Q?zE8icFvg+BwdNJMqOs5VXLKaEG3Lyvd9hhNG/fEQ/428+Ishv7DVdAnfLqPh?=
 =?us-ascii?Q?amBETWx2b8j86j6mFlA1AN/YFxbq1yezrXOdNQNujJOxLDAWLIKjQ5QD6Qrl?=
 =?us-ascii?Q?I6Pk/G4oRokgFV77p8JazsVhKgGvLpjUn4j+sBNh+pnX0BxD70nTCT65yfDk?=
 =?us-ascii?Q?mT1DhTORCfvNGhH5EWDvnP5gjzYJ7gbibCoM8eEKjLQrUe2IoCz9wuuy+BrM?=
 =?us-ascii?Q?tAwt4GsTlo0CjMf7o9kaXFUHYEknVp1Crl/Vp8xUMNUfFdztP+3J3gHGAkUG?=
 =?us-ascii?Q?5X/wyLDAkYnhydz9laSnPRvHVNNKUuFKysXLBfGSiWZbnn25zg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vzGhe118o5oIIO0ekqp+nHqK+xnmnhC4rq9n/4mfQFx87ZdX3wiYTxee2wB6?=
 =?us-ascii?Q?lK4god3h3n3EeXi7ieSwPJVyHv3kW7+G1adgQflzh3br6BELFUoBA5zDJ5td?=
 =?us-ascii?Q?FQ+GTynO05b4QtZ/jyTQ59fxXaN2E6muVSQml7nH/BJrONa8wbCwln5MLvNu?=
 =?us-ascii?Q?n5GB/RwjgIrx5uHL6hUWymQ0mvYQtDdrQssh7cotbAbHkVwWpsQVkzccVtvN?=
 =?us-ascii?Q?CTtxVQFUz1lq8+MerYlSSEAyTqbv2sRgS4h7CvoJzgvnB8zzsp2uQX1lB6rt?=
 =?us-ascii?Q?bO34kHvh0gOnrYIRvF0bG32wPiZWcm7XZSFnWQv+FewXEN9EM3xGKgT60TaE?=
 =?us-ascii?Q?STu90Iyq2FvehbEKnVz0uOoadadWtx+UD/gpn2+0AjVTa7nuA6N8MO8DHS0C?=
 =?us-ascii?Q?xWWu8YzPCZ2TrM4rT7aIqnHNhTqgJxvxNcQptb1kRIgC6H6mLF8AHEMIQzTx?=
 =?us-ascii?Q?W5PkoEB5Jbwo/uIo8aUD5npnt0PID5SY+WwhAKuqOhL5TuzT6oT2Z9FXOu8f?=
 =?us-ascii?Q?2sn72x30Hc+MCQh3F+ENKikefby9K3TBAQYzrD0jK+RLM7HaAaG5VYjnx/g3?=
 =?us-ascii?Q?MqSiXIFtJdDlO+JYWSD7EEz1+BK5hOqYby/eYnXue32cmoMFP17UWnMz46RI?=
 =?us-ascii?Q?JMSp2vzqFLWeto7A/P1jmNLy8P0nbtz3R4Dn7I2JN4ZUuTqpzxq6YzHtse6c?=
 =?us-ascii?Q?wFKpm3Z9CKfXX+3VQ/bdASLyqPfMiAxzEZsggiw6BFRtlUAdw9qDixqsvdFY?=
 =?us-ascii?Q?oaf2WI0+CLqVYhnmP2uBkg0eYUTh4tIhLW9pbq+xiqUOg3TIDQCS7A4qbS4b?=
 =?us-ascii?Q?BacIhxL6vyDaucxumB03wM25GMgSXg9KufJDEAFGRS/ntjJgZb+AU7A787RD?=
 =?us-ascii?Q?LWsW0Fr26dD3EiggtVJIIYPjIotReHe+//IPzMByUbs/QG6+qQ7WNA2PuxlJ?=
 =?us-ascii?Q?3qlJov93+3iP32Eo/9K5ODnDXXy3odYiX4u0IehniTpLQvhe3e2fo5sbppA7?=
 =?us-ascii?Q?S5gWNcsVp2GAuZdiAWeDdxaFYIJB5ruLcpydQkiYUAAhV+3mhZoMMKgwa7ih?=
 =?us-ascii?Q?EjgP0WPUbtA8royyN6CU/Huo0ZSTZxSS3B37EWhX9pE0wcsK4FyfUAb2sxs3?=
 =?us-ascii?Q?XyiXK9LPlcCyf5jOFJAxF6AuZ5CR5mgU+ZHXcqDCdzEHJWaR3sPfOXiXVU7h?=
 =?us-ascii?Q?14KYmYo/8BWEe1Axh9I5a4/L2Xyv6D4ivu1jBLXXB7QugeCkSQCLnqPC3xz3?=
 =?us-ascii?Q?ptHKzy8Cn3yBF+QseEX3+APWChu/gvfN/gfoKAYtZM1OVlHlhRnLxrzJHk+O?=
 =?us-ascii?Q?igMQf6LQKARwxIIBHvCN/hi9Cq4EeVIL2PSlavwopQnJKZN/fRjSamiZIARx?=
 =?us-ascii?Q?Xpp3Rm1JZYTmkkK2jsUyjIAsVLLFxJnQYyTl6zQPsY7mZdm39hcD0Dlm6Lug?=
 =?us-ascii?Q?bUfUV56xp2Yw87RJwBdRdz5mnzruHm8Ib4pcz0QU3SCV8QWLsKFZp+ksi2Y9?=
 =?us-ascii?Q?MAnBZSsL5XqZ5hutJw4ywY1UdfV5C+dMEYTXcUturLRV4QHSPW3CA7AwvY0N?=
 =?us-ascii?Q?6eNMWecNjFfsLk/Ax0UnmuXXKXn3svHid4Jt+bGE?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47020eb7-a571-495c-2411-08dcc1c3ad46
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 09:28:55.4175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zqCHcJIHm7UT/HR9v327foyt5iAxJ5OVRwcUxqYHnxs+qr5wx2/mpDX66YF5CZ3oUrrO56YZxvXqiQ4P9C28/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7199

The devm_clk_get_enabled() helpers:
    - call devm_clk_get()
    - call clk_prepare_enable() and register what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids the calls to clk_disable_unprepare().

Liao Yuanhong (7):
  rtc:rtc-at91rm9200:Use devm_clk_get_enabled() helpers
  rtc:rtc-imxdi:Use devm_clk_get_enabled() helpers
  rtc:rtc-mt7622:Use devm_clk_get_enabled() helpers
  rtc:rtc-s3c:Use devm_clk_get_enabled() helpers
  rtc:rtc-sa1100:Use devm_clk_get_enabled() helpers
  rtc:rtc-tegra:Use devm_clk_get_enabled() helpers
  rtc:rtc-xgene:Use devm_clk_get_enabled() helpers

 drivers/rtc/rtc-at91rm9200.c | 18 +++---------------
 drivers/rtc/rtc-imxdi.c      | 18 ++++--------------
 drivers/rtc/rtc-mt7622.c     | 24 ++++--------------------
 drivers/rtc/rtc-s3c.c        | 19 +++----------------
 drivers/rtc/rtc-sa1100.c     | 10 ++--------
 drivers/rtc/rtc-tegra.c      | 22 +++-------------------
 drivers/rtc/rtc-xgene.c      | 23 ++++-------------------
 7 files changed, 23 insertions(+), 111 deletions(-)

-- 
2.25.1



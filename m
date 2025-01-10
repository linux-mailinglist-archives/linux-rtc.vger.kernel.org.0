Return-Path: <linux-rtc+bounces-2865-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DFCA08839
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jan 2025 07:18:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2FF43A4E04
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jan 2025 06:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E1D2080F3;
	Fri, 10 Jan 2025 06:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="j24Z5f+c"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2071.outbound.protection.outlook.com [40.107.104.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DA82080EC;
	Fri, 10 Jan 2025 06:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736489709; cv=fail; b=NZbcFYlxQ0rdyk36xtiAuMP1aT3sGonCqQzKQXLscyAXFby4ezUf6amIr+eOOjSfss+AfNoUDGMkYZ9M9H4ogOEouI5YINxeNsdi1k2dl3uTAkgL2TNtkpnq2EWgLaDo9MD1ErcLeuzvaqiITTxH9J1P3u9TsB/6oRZYheviV4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736489709; c=relaxed/simple;
	bh=9rwquIvp6R+yq/5nf5ecc2D5FNhR+EogoeGZLIvCv+s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Uf5Yo8qUJo1SmnXgsiW/Tv5JFWCanzCBxbHx9JyyNdXluoIwUQO0xGcr3+isIHlDefRhpk+ZwL2MNSSxCnifwegZJel4KFifxXflhBv2QIFr73bxvTSFRd6HO6zVGIzumRAZq+bhP0T2Zd7X/RoQMECF9kX8F+z4Tu48aKaPGuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=j24Z5f+c; arc=fail smtp.client-ip=40.107.104.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gIUKr4lB5Zt7JZyn6zHA4Re3Y1B7w4oLXN77wVyu0opjbF+zRt33Nf11APHWkBNg2gUc5CnN5kBEZxvksRJN6o7l+8jrR5Tw0GUIiKzc/8J4FmyXybTQIeUJ+xGDaN0TA2FQn7PAHxScQhwwc/wqBw96dY11iMVrFIxtDz6AmFSUqr7Y7y0NDbcou9iXJMk6mS629R9IoaoBB6A8AJHHlmOtevA7Z7URkEBoPIMUYI4YvIoKAn/sDheHKmHgCCv2FrjprEfNxeZU21+VejLewuyUsCD5RG7gFfF4vnynN4fLsyOpH3LG0axywUtbLrB7vy4ukeBZBzPQjgJvSXtQ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCDqbAVCya0afMSxRTlP4R35cVPet51O2XCHHRmyPoo=;
 b=m+M1gfo02HzfM4Pwk3wNxAh3DYj1aPx6wPZaF53roePdu101mzGqd1VURnxON/Gjed2qiGWV+2E/o5XMa/KnDSQxu29YEqLdyAuWhoCZAYNo6y5QE1XoqkM6o/La5DgrnVDLc5m90UwLkT54KIdZc9imlhReTpL+QfpskYWH1FvIyGh/s2uS9qJG8Zx8wvsjUI1adrt+o1jZdZ5vwkaGRVs0RMa2zcnNx8WkaNvFn6+jL0V5tLU2XGg3B5R9/7+udkEHq4Sq5M7YMLVjnWTnVMPoJ9Ej1rvCRizYTt51hWrHZ3G+6SXMXJ/kCSCZJ1rP0zePWnmKh1Qvr/4JSWDl1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCDqbAVCya0afMSxRTlP4R35cVPet51O2XCHHRmyPoo=;
 b=j24Z5f+cjJZ1J1jVoQo4pi7Ym8tVfxbhUcPbg690WdhzdqxE8sV3mp/Gd5Sk726/YfWHFPIMAQd1EfSnhAKCsbkn1CwQtv+mN0IyesJo2gQVbz4oJu8Dq5HrvuY8DJMYC4R60W2exNVQfa7TK/po9tTuPtmuNPJ+NIFfnW90FukoPvVZl4hW7B/CJt7/Sxx5C0mQ7gDhXnRNToB3lflMmeCkff1se4oF8Foh4kumZokxrrF2sRQrj5I+JGzIX8q8iGrizjb0FlSDfJJW46zTDEceAdqkfy8QARx4Oz+HoAX/W9Jt2juO3eQA5rgVxiYzKWIzGjngHnMI7BqUHwlDnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by AS8PR03MB6776.eurprd03.prod.outlook.com (2603:10a6:20b:29c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 06:15:05 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 06:15:05 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Manuel Traut <manuel.traut@mt.com>
Subject: [PATCH v1 5/7] rtc-rv8803: extend sysfs to trigger internal ts-event
Date: Fri, 10 Jan 2025 07:13:59 +0100
Message-Id: <20250110061401.358371-6-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250110061401.358371-1-markus.burri@mt.com>
References: <20250110061401.358371-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0156.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::6) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|AS8PR03MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b2810c0-b5f1-4a59-9313-08dd313e201a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aPck5nG3IZNndgTL7hxclGx4Tht1VLaI4FOh1fXOysjClkX0jcuR6nwxORci?=
 =?us-ascii?Q?VKDVZ9ubzRtKZz99PCtZ7yXDv6Z6JDCdmImfAY4wWT9pjJdk7BBuhSgv7SJb?=
 =?us-ascii?Q?fIpMFjBy1ZOOoJPKeZsPBmK+mZF2RrB2KD5TvgXU+lLiosojXM1DPMf6y+/Y?=
 =?us-ascii?Q?/HQwPVcXn75XOsW5Ud6VZGke/iAOWUoxDRCw5dchl+nq+72oOCZSuz+y/yYc?=
 =?us-ascii?Q?dHZMsYJ/RsAgbrkNI5PT+fNBdTPs3hD9WB7UzPmMI9Fx2POfT8qjm2JU+54S?=
 =?us-ascii?Q?RkAvskG4QBMvEPqpcz2ogDJ4Pb5MQ8iMhwxD9SXHzMFqtHeJVB9lvjR1tDwZ?=
 =?us-ascii?Q?E7LJ6tYKJQUJO5SZXdk7hj4ldjDlGxy5KYtgIPol5QfOv53WrnGX5jSQfaTS?=
 =?us-ascii?Q?FmvJ2HeSo+8p6j9GdxDPhguzEbeRxvfiDCp2Ok4eI8w3o6qz3lLlKv9YZtEP?=
 =?us-ascii?Q?MHAyQNbV8ET7jUM1htgeUwaeHfYp9ipF44F1tZyh8qE4RBjF8Naz02dl6eaw?=
 =?us-ascii?Q?MfpBvjOOtqcvUxQ6zkNrS7QOc2f7vQGbE9xYNrkUDaRqJ/svsXKhje37hHCN?=
 =?us-ascii?Q?EUTY/hb4Tls3iTY4LTODvzZBTwuStLkohdpf6Z1n0E9ooCwWX7wq58MnQHE1?=
 =?us-ascii?Q?qpDuNmOc7psAJsVEV3CcjgxIR1B4F4O5gz4ql+XfeEjGdfIGVQEGwAjcgbB/?=
 =?us-ascii?Q?JLB0iLtp4oxp73uO473QOWzxJlHtWCXl9hPkoI0iv8KS7nzp4R0R8XVyvwW0?=
 =?us-ascii?Q?pAT8LFM0Nr069xAk6ywTWW4v4ka6PjmMjFt3b7WTeFvaX0RLaJseZJY6FQyq?=
 =?us-ascii?Q?JrK7MuxqIhtUa+40U6eV0e4X9G9CcVzHK4Z3dDGKG0mcoCcX+5pR0v9r5f2g?=
 =?us-ascii?Q?6rqCDfWzeEJg9gN+SjT0O3ql5hw99T1W6V9EZlXymgTsAPNo6YkRDILePyNV?=
 =?us-ascii?Q?Q4DzLXxZRMzBeZf3RNh7EiahBcmHFIZc6FDyhR7DExYpOUX0rviN6Bc5cbNC?=
 =?us-ascii?Q?VB0A8p60FMhCyA58CDX81pMhqv4rjauCU6a55A315Lvbff1+tJ7oiAZH5Vqy?=
 =?us-ascii?Q?u9WVi5k+OXtwSqFtksFmr9hPFfXuxUaKpRmB35io5dj03wV+32Q4mTrDNVrB?=
 =?us-ascii?Q?pC93VDHTjgdFPiSVrZxkzlVpYACcl9hezhoDzF83mUWDgD/oTYSsOWO538oh?=
 =?us-ascii?Q?LrI6FmfdHRgu3J4X60ZYH+pjVev7/JAnuFwStS+BcflolwdJq/kVf19GgtKL?=
 =?us-ascii?Q?Qv96pLVSRcZAKH/KDp4MRgDbLH/oblDbM1J6wwUwAiEC3Su5rky9Ew2DcSr8?=
 =?us-ascii?Q?b8HYvyynw0z4+Mwge37hTYuNN1jJPDnwI9QrmMXbW2J91PQeJO2Q/Rgg4i0e?=
 =?us-ascii?Q?1gx/7ukgnCAbcqgHu9R8BxjbuMF5mLmqdBlW949Xilkjy2z9gNFewbyWwIz9?=
 =?us-ascii?Q?5uts0oSM7ZZBMGVDH830O+ZsuhwhYZDi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SakPf5trQ3x4r6ScHTfXyfI+sav6vXhR3tl3nJscNkFEPUhVragj5fSQ48qn?=
 =?us-ascii?Q?EkPm2vqK1rjEsTnM3Sc83d6FYYN1ldspwNAXRyzbn7CMixokWGAI2l0+ODvV?=
 =?us-ascii?Q?+VwlR3Hdxo8QzcjlFXahd1cvNIZ8LIFU9MuVARLKLP2zFzWoCoI2483F4043?=
 =?us-ascii?Q?/ofMLDxnZodeNYHryfCM2hx91A8TwQAa8gFipe5ZPHIZfgbPhaVnzfjc8hdW?=
 =?us-ascii?Q?MsQ8aBmYuPqHmYw25TYOXReTETNjzL/6ZBEM4E8mHsaOO9iTg7g6FxZ3wlYW?=
 =?us-ascii?Q?dB03A+pdYL9v5J11jRDq9KFlTyiZT9kxsE2FiN6J/qzvsUC+i69RqXqttsaN?=
 =?us-ascii?Q?VanU3KBzj8BpuTRiVcl3pCmu9VRY988wSV6YhMXo4H1BSOlwG2Evo9gAhYWO?=
 =?us-ascii?Q?N0tD5/BCVraxZMT6pqYHjl8/yqHugAWVyThMCj7RGNzp6KjXQwec2/KgLz+h?=
 =?us-ascii?Q?NsZeIdJTdiIxXkG/gG2ozTBQ7n1Lg4+zudYtnDWjgjr4T8jaTPrA6qT9J3CZ?=
 =?us-ascii?Q?vjJe0KdX6YJ0wyfr0Aqum38u94msVO1swMa114h0RtRbPgl7Gj9FbNEtcd4P?=
 =?us-ascii?Q?5y67YgEHOspHRb1cNz89MYULLA82xUIrmIL9d/PPvJbvrohV2y2lh/2QPUYC?=
 =?us-ascii?Q?I5LdOZ1Uq1EP8FvoylDpIlneHhk5M8n0moZYSOyuU5AYlndgcE0UwyLuGJBk?=
 =?us-ascii?Q?uupyt70RRvl5/fzjvaWQa3QEYhFyuLVSqgsHrSzGN//MeJZopEn5Rwi3kPCW?=
 =?us-ascii?Q?zKlbQ/2T5rKXXOVyY3pH0JpOCnzbdPU1axANRakXCDHgBve+YQcslv29nIx1?=
 =?us-ascii?Q?qvTlwPuGFpTUMCkb1+HtLFT52iD2imOZv/fzdo3cmjTA1dwiU2rZMXDBoqWz?=
 =?us-ascii?Q?7vy6HewYxEItkjb120X29zQN2QWaMXkaDLj3CvkdLmIyzDmhcIi9f3R1oL7t?=
 =?us-ascii?Q?9OYeDNoIsNKrTtM0h3NCae430Mh5P9C7uiQGnvd2Iu8wcB/EfRCuvS3sur0U?=
 =?us-ascii?Q?+/Fu4Wh/by/fQ0kdOZJfKqA5tirCmZXIpEEXbnyS96caCuYPGfO7heo0MMRu?=
 =?us-ascii?Q?kml9OTXYr87+yLv1+C+dS1Q7IKZl1hlvB+BghS7fGFmUD0FJTjnvD3kPD/K8?=
 =?us-ascii?Q?j+o9nmm8sJobl+nx7gC1ml/NEt5C2iN4FQf/E7JfDg8yAFIjN0DzhZQ52Tfi?=
 =?us-ascii?Q?jyblpAcUZFRbyypa5G9OO+Df2ZHWSyeI9lFlta1+FZbnwS44vNG2VRhFp2if?=
 =?us-ascii?Q?VEYgvID7caz8KnoHShfbijYEsLOYBQklk3dHAGIAKJnHC2hLRQrpzx6n7F1X?=
 =?us-ascii?Q?DHemjB+Bq4c+hjqrSgrpgfuefn91BUl0dotlwmvowTOqmuqId+SRT/BBEEee?=
 =?us-ascii?Q?wu+YDIEfnTsI46V/H2y7GHF5MADk+Mz9Q3J9YZhoiPI3UVTBtZ/Jt8Wy9iTN?=
 =?us-ascii?Q?u6jLGj7HY5skP5XHk9LH8TzPRgN5Z/rjOra5rYRj1OG0eW6fqijqQtdpDb2m?=
 =?us-ascii?Q?/j4n3sS7ARRPv/hsEkJ3XYxREQzzb0A4tNLiArVJz6zlpduZCJ+w827AI8xm?=
 =?us-ascii?Q?HluissLFcHo8g605IRCGlDvmp2+qdaSSxTcRfu8O?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b2810c0-b5f1-4a59-9313-08dd313e201a
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 06:15:05.3872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jCjs0u5Iu4Gk4FY1aGvoW08bvtifJBHEdRgslEjMSzdqK7W0pteHFrgfrFduhTUco4jHlGZ3Nn5kbekTR136lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6776

Extend sysfs to trigger an internal time-stamp event.

The trigger function can be used from an application to trigger an
internal time-stamp event.

Signed-off-by: Markus Burri <markus.burri@mt.com>

---
 drivers/rtc/rtc-rv8803.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 754657d..c479cc7 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -937,12 +937,45 @@ static ssize_t read_show(struct device *dev, struct device_attribute *attr, char
 	return offset;
 }
 
+static ssize_t trigger_store(struct device *dev, struct device_attribute *attr, const char *buf,
+			     size_t count)
+{
+	struct rv8803_data *rv8803 = dev_get_drvdata(dev->parent);
+	struct i2c_client *client = rv8803->client;
+	int ret;
+	unsigned long tmo;
+
+	guard(mutex)(&rv8803->flags_lock);
+
+	/* CMDTRGEN */
+	ret = rv8803_write_reg(client, RX8901_WRCMD_CFG, BIT(0));
+	if (ret < 0)
+		return ret;
+	ret = rv8803_write_reg(client, RX8901_WRCMD_TRG, 0xFF);
+	if (ret < 0)
+		return ret;
+
+	tmo = jiffies + msecs_to_jiffies(100); /* timeout 100ms */
+	do {
+		usleep_range(10, 2000);
+		ret = rv8803_read_reg(client, RX8901_WRCMD_TRG);
+		if (ret < 0)
+			return ret;
+		if (time_after(jiffies, tmo))
+			return -EBUSY;
+	} while (ret);
+
+	return count;
+}
+
 static DEVICE_ATTR_WO(enable);
 static DEVICE_ATTR_RO(read);
+static DEVICE_ATTR_WO(trigger);
 
 static struct attribute *rv8803_rtc_event_attrs[] = {
 	&dev_attr_enable.attr,
 	&dev_attr_read.attr,
+	&dev_attr_trigger.attr,
 	NULL
 };
 
-- 
2.39.5



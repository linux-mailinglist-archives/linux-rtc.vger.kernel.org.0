Return-Path: <linux-rtc+bounces-4092-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDFEAB59A2
	for <lists+linux-rtc@lfdr.de>; Tue, 13 May 2025 18:20:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C113864D7B
	for <lists+linux-rtc@lfdr.de>; Tue, 13 May 2025 16:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2902BEC57;
	Tue, 13 May 2025 16:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="JzWcQHZC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2078.outbound.protection.outlook.com [40.107.22.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275282BF3F4;
	Tue, 13 May 2025 16:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747153205; cv=fail; b=WYHM40PkGBTAPzonCbbgeRGTduAHk+yGZRrizaADlIc4hCSneK+NPHZHlHPr3oaWDg6A5r5ZKxzWka7aw19YzhILCT4R/rtA//Xg/pOxmiI/2yexVz547++TiP7HXsKMyJrLDeGj31bN3NKu8i2iCCOMa3Swvk+Q222/fOyZC9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747153205; c=relaxed/simple;
	bh=SYMAaAMvDoXEToCxfqSCrW89cr/xHmgtseHLigX8txg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DvSJ2/ulkZOwpM857u2jOuaes5E5uUkJYJzoQlda3skIbTgsR6jbbFJKrHPXyq3H0lT3lFt+Dgp4GBCUcZK0V6vHFx8xWca8xwDdBPxWW8lDSUG8UKqgIQ5OEugR4H9EuSXN9hcB+g8eCB4Gmjmh4RLNHhUx+1soqzE4o+KMZHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=JzWcQHZC; arc=fail smtp.client-ip=40.107.22.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iY40IZ8e52PK7xfeSgVzTcxMc76ZzBQ3G4ys99D1fN+8QUbom5fFXpKizLY2zd3SZTXUFmFxlIEuBjGLa9eEyWuLDPAsfZzwCyjtSbSzQGcUfN+KWIvd0ZkM278Eir27Dt20XpfaA64o9vZlxV+WSVbl6yioAffwQMAtEsjYJN2A9LtQEJm8pZoy4SFyoXN7dU2uk6BbHPUnKbXtGA83QEjyJwyah4vNOPx60IUMHeMnyMo1r6WP1MF3avQYUh+hWcl1nEtsuk2jTgdDtxtdMsoR8+lgWh0VbV8z7D9tJHNl3kXeV/p/m4vGs/LU42vhbNo/5BEUfioLTW2slb3gog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsRCCeOKY4NaiCFBt1H76CDX82nFsgaQFOBzAkv/uQM=;
 b=rDM/8iZJyO68ldXQTESkMDAqICC+iBVgLOUcVm5pEhcbHJi28ZvKzsO5UDWJXJbDINRfEN5XhANNCHr1J6MY5JW+NTcJsbfOzeYXxE6B3759AKw6vovJUlRWIHx7/rjvlQnFsL63ahUXHSb9K8RBOpquE1QDlBiGuGhSOhs077ff5BUprMfVpnX4p/qw1Kr9KU267NY/CXnoqrlAQ9uGplE8w60en3dmpJLcV8AZKcVdeoyY0FTvPVctdm26+bcD6K6zDiuEG7yYeebRinYYYAtv/DtGCoBRPM63bqNHawxrUKknoUwKJf86C/dZEmWhD87fbWaJ7vBxvs69QGWPKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsRCCeOKY4NaiCFBt1H76CDX82nFsgaQFOBzAkv/uQM=;
 b=JzWcQHZC4LfezPxt7IT3Lsc3GzogxkK9w17ffPa9HWSmbSgYWQGLRu6QIJatTvRwFxoAUBPia/U0HgSnzVwAhN+vMM/Bot6+FsVPtW46zVdB+CNfwoSlZmsJjMwSwGkv9dd4Po/YySiWYX09f+iOCvhqn+90SKPFBPUYrKvP9QoE0x/FrhCb12IuYaUVyqOOv9buxB9o5ZCV+l/x7SlCr86FPlTP3BgnF4Mvey4rMOc/YEjKekukfHrmiPFOXEoIN+e9vgXWCdCps12gHo2f8QYwY0zE2tDjqNPF8umrBVgWlWs6LeMliJI2adpkGbEd0mpHW0KkCXcCVu6I1VkLAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com (2603:10a6:6:36::19) by
 AM9PR03MB6724.eurprd03.prod.outlook.com (2603:10a6:20b:280::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 16:20:00 +0000
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b]) by DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b%4]) with mapi id 15.20.8678.033; Tue, 13 May 2025
 16:20:00 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manuel Traut <manuel.traut@mt.com>,
	Marek Vasut <marex@denx.de>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Markus Burri <markus.burri@bbv.ch>
Subject: [PATCH v3 3/7] rtc-rv8803: add tamper function to sysfs for rv8901
Date: Tue, 13 May 2025 18:19:18 +0200
Message-Id: <20250513161922.4064-4-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250513161922.4064-1-markus.burri@mt.com>
References: <20250513161922.4064-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0008.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::11) To DB6PR03MB3062.eurprd03.prod.outlook.com
 (2603:10a6:6:36::19)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB6PR03MB3062:EE_|AM9PR03MB6724:EE_
X-MS-Office365-Filtering-Correlation-Id: 700569ba-3dd6-4da8-fbe5-08dd923a027a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5/3i9H8kn5TZyQ8kkgzrjkco3WBvmST0RGTurgQm5t+mAWLy4HTRAiKdQpJ8?=
 =?us-ascii?Q?2Dea+y0Nf+/nblUHtnTVxAsMY3Zkmftg0yjVUPt9VyQ8LbKgAqRJz5nR242p?=
 =?us-ascii?Q?8RJ4MtbO7SEa/Yh1aito9RwmHqVdI/CMcOtPoXVgj0sOhX7+n3JcNDuTTNw3?=
 =?us-ascii?Q?/BsyiOp91O05/4E3kovcEq2awyYACF4joo9KFEVPwmdRwlL4dCeHVyhl5c6l?=
 =?us-ascii?Q?H8bgEMWWHch7DlSJhpKSHxx7XR+lDSC7UWWMIcTxcLvT9+0eGhxGgViJAEby?=
 =?us-ascii?Q?cFzjOSvIaoeB+zrnMgG7IK+/TvLeR2DbZJXkZhiSVOoYpZP84S5cWB0o5xfw?=
 =?us-ascii?Q?69v8sim16vm80JUrXpNlXbTKlC6H3EJqkN33i8xPZdLOEpNWUafVm+pJ6eHJ?=
 =?us-ascii?Q?KQOPFylXGNhOk7TbtqhaH/zCbQtbzrJqDdGyCWwuBDkqu2+AfTYSwlCZgkn7?=
 =?us-ascii?Q?40jRYaq75m8wsObcoCWtKKwrwcyk6/rLyLSJHnyH+MX2n1TUt0eoefEQ6qdi?=
 =?us-ascii?Q?2oD2nxV4bop6z7JRv7MGFtNDad4Ind4EcA3a13qKN2CFZanV+TMpGWQDlRjQ?=
 =?us-ascii?Q?ivclayMZcbakbw1WG6XCH+J4uxbaq89TuO8u6bbN1iwoAp0i65hbhABC0krW?=
 =?us-ascii?Q?+iO+vn46QWoZ8ySfq6M1mg5PC4a6Nmy26VrTB4WcgzxG4A34GjUY5dZ/Kw3/?=
 =?us-ascii?Q?IGRWdjV8XXnnAaisrAsRmqL7E46EKfhtI5vgqJQcRwiuzxyaHZ5odcrskfM8?=
 =?us-ascii?Q?ktd4n9y6khzMeId0nGhlW1OMFh5byVBk4wfyZPqaOaJD1ilzwS6h2PUW/l7S?=
 =?us-ascii?Q?bDaOxFZ0FLomxw7jPW/DUocAGuJnDkP2ICf5SG5Jh4PZ27UgW96NDn+f0x7A?=
 =?us-ascii?Q?YKFPjiWZPwRUPLmjPFZVG12Hnmh69tvaZ4jwWct83Zc3JEJ3RB6vb/mDHMWT?=
 =?us-ascii?Q?J2YaPvzKTYR2QazH67Knlr+zLVRN1hytd3DkHAIBpXXkkpbHQJx7zOPPxq8U?=
 =?us-ascii?Q?d1LSl/DbVThx7gtyJ/yJIXzmmZ2toZTXe50IMXtjS4s6yegjhWPNv8xIz8yR?=
 =?us-ascii?Q?t7WuRGNtsTt7NiqvvNbPzjgZ1j5UUbi1jBM8efmyChVaUD/owK+OA/0QlLyG?=
 =?us-ascii?Q?leXRwhVKgRp5eGO4z3JeXyG3O79nnljgyprjefjm3b0PiEV6e8QwOPSfUL9U?=
 =?us-ascii?Q?BEiiDhQhuwxyEKe39Vc8+MCXllbVjsfq2oqovD278aYYy0TIywq0dURAAuxI?=
 =?us-ascii?Q?b85kqSO7xL++2k9DzIQq5sjkar+JB+l+4he4MIJvD8yC/e+gz8lsm1wx0y3P?=
 =?us-ascii?Q?bZSLxCeDs8cIWUqwJS1BN9oqDNr72loi/YhW4wbpJ5fhsHYkaOPH16+6+33U?=
 =?us-ascii?Q?9154RAfwQSxM/yr8KeowiKclY2CC5re4KoWNVHONDgO8aY6JovljPuOCOZS5?=
 =?us-ascii?Q?HPj9hbVy8UA8fQrASKLPaIGYzMOGz9kPYfGkpuMZFahXIkEMJx9dJg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3062.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5ddxZURwFOD5q2TjGAePLiTLPJ/RJe+/ifskGPtIkUZ8pZwM08R4iKhJoORX?=
 =?us-ascii?Q?/sroeT9LirOhdPgFiW4xqPq/88FNK5C1JC4Zrabv5hbjCTB8NC2kpm0dOsrA?=
 =?us-ascii?Q?yUS1Hsb18WjbQ5Lv5yZOBzZ39ZWWHN+3A0uteRTMdKDEpeKMQQY940WJQo9y?=
 =?us-ascii?Q?hIbHlYMjGl1rYSggwKeMVdlZUi5itPE5bQV3lT78psD0DJaJ+LJsAEsXagD0?=
 =?us-ascii?Q?gptBpDEWdW7OkSeDYCsZX4obw6BOX6HPFwrh7uuvbMZz7KE5IW5nFgrC07+n?=
 =?us-ascii?Q?0/m9hSH3i5CGivDo2l5EiZy1J82wLpC1jHulvviDxuzVPByTw+k+QLmNpOW5?=
 =?us-ascii?Q?J5j+7I2YhsAEQdiF/F0zPRva11jEenKQdSOOfuM3RU37QLka0SBrUuAGreMx?=
 =?us-ascii?Q?h6VDp42iIfLVbUsnumSPT9OUjg2vr5umw3IGpBsSHkqyS9LEqrVc2jk6x9Gk?=
 =?us-ascii?Q?5PYZFjNnXrhZ08uWYNrdLBUyt9dJV5LdwgZuaiWAYgsk0TJIPH5af5oLv5t3?=
 =?us-ascii?Q?n4Dwhp37OIJwNT2hZjPojs6fSekkj28leHro5hljygKW3U/NnWsrhor5lbOW?=
 =?us-ascii?Q?sXpZwdpXnwWf1n+6JNqo6AnYVpxxXtO7eo2kf1EVJamfnOVbCH9m4RmzZREy?=
 =?us-ascii?Q?2F65VW5aySKiONyahOAFqz8QoEL62uyOwKdQEcs6oJmPZMwvShTQWRIuv7xz?=
 =?us-ascii?Q?V7XA3i1YGS57wBJCBvQ6GIZTqOAvU4opQ/ZEVcjvxzr/tUCM9mda1ygktuIY?=
 =?us-ascii?Q?eKNKHMMotmwAAm7q6cSHTImRKFVBuSX0EMZw0GhQqAVPPKJC+TpXS58LPLUx?=
 =?us-ascii?Q?gpDKEvVv2WBRmytAZt5QSfsk6PoKIFcRCxtwC31wWO7XVagz5uX7Lwdqt5lr?=
 =?us-ascii?Q?AJScINWReI9XsOfZuZFlxMo/cNhDN2mhUsS30jEvqJifqo7OzVKu14Vmr6vC?=
 =?us-ascii?Q?jxFe/LFoEC6sBFPKjWG5AMdoCTYXcJjjU4t4F96ttimmKUegEAwcCYP7lkhq?=
 =?us-ascii?Q?c3FRNCj/3UTRZOIEYnnSE00VfG6GeGLy7si+sCMB0o9EjNovacgZ9eMqoL5y?=
 =?us-ascii?Q?KiFsoxNKVCSqzJS9kpfJt62Mz5AIA27v3QUAvY4TomaYbMTlgssVdwntmo4t?=
 =?us-ascii?Q?CCkXlHLjmrYTNKSbMW899NgHFeQPh9rGAMCAN5Wg2zD80iV9vBh97lzlG4lE?=
 =?us-ascii?Q?nBu9dH9P1VWoLzks5zX39OzWCXfdsgN6yTTuEZSpQa/2azAoCYowYKPBjMa7?=
 =?us-ascii?Q?8fJhSoZV4Uo+03Zd20xrOdMZPUq8TS7oYDd13jHUhMe+/EkdOWUoCM2V8xJt?=
 =?us-ascii?Q?D3NDlDMVXIRTBUX8EzHaxJGyGZfP287JwVIVGjkw/puUA4X//F5uYXqfHhRm?=
 =?us-ascii?Q?uQ6bwvqbCfjWtEJ03lXW6yQEhk8Bw+lX7GSJeN6loT8KwQQUjXZW5YHCEnGC?=
 =?us-ascii?Q?UgviOZb44sVmO3jbAA0LtDZTKgzx6Ndqaf6+d2+vSJtHBU4hm0m+pZyn7Ruh?=
 =?us-ascii?Q?G84zFYB+u0mNyi9hpyMncM2gHE12XTe2Ce8kNzINQhotaRxYy5cNXqRf6Kkj?=
 =?us-ascii?Q?h1Dy0ijKQ3SSpsTcnyb2HoFkzbB1hyNespbT6i1+?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 700569ba-3dd6-4da8-fbe5-08dd923a027a
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3062.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 16:20:00.4963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TH3cLR/jp20zydGn5ks19tnlI8yJTe6m9XMy9J0ik0fnWncq5WoZBb4rsfAduRn4D+MOKoGJqsXNN0mrCpmSXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6724

Add sysfs interface to enable the EVINx pins and read the time-stamp
events from EVINX.

Signed-off-by: Markus Burri <markus.burri@mt.com>
Reviewed-by: Manuel Traut <manuel.traut@mt.com>
---
 .../ABI/testing/sysfs-class-rtc-tamper        |  21 +
 drivers/rtc/rtc-rv8803.c                      | 366 ++++++++++++++++++
 2 files changed, 387 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-rtc-tamper

diff --git a/Documentation/ABI/testing/sysfs-class-rtc-tamper b/Documentation/ABI/testing/sysfs-class-rtc-tamper
new file mode 100644
index 000000000000..f035d0fa5fde
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-rtc-tamper
@@ -0,0 +1,21 @@
+What:		/sys/class/rtc/rtcX/tamper/enable
+Date:		January 2025
+KernelVersion:	6.13
+Contact:	Markus Burri <markus.burri@mt.com>
+Description:	(WO) Attribute to enable and disable the rtc tamper function.
+		Write a '1' to enable tamper detection or a '0' to disable.
+
+What:		/sys/class/rtc/rtcX/tamper/read
+Date:		January 2025
+KernelVersion:	6.13
+Contact:	Markus Burri <markus.burri@mt.com>
+Description:	(RO) Attribute to read the stored timestamps form buffer FIFO.
+		The timestamps are returned one by one
+		Format is 'seconds.milliseconds' since the epoch followed by the trigger events.
+		The value of the event is the current pin value.
+
+		Example values:
+		- "1234.567 EVIN1=1" for a trigger from EVIN1 changed from low to high
+		- "1234.567 EVIN1=0 EVIN2=1 for a simultaneous trigger of EVIN1 changed to low and
+		  EVIN2 changed to high.
+
diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 50fbae931cb2..ef2231e5abc9 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -10,6 +10,7 @@
 #include <linux/bcd.h>
 #include <linux/bitops.h>
 #include <linux/bitfield.h>
+#include <linux/delay.h>
 #include <linux/log2.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
@@ -58,6 +59,35 @@
 #define RX8900_FLAG_SWOFF		BIT(2)
 #define RX8900_FLAG_VDETOFF		BIT(3)
 
+#define RX8901_EVIN_EN			0x20
+#define RX8901_EVIN1_CFG		0x21
+#define RX8901_EVIN2_CFG		0x23
+#define RX8901_EVIN3_CFG		0x25
+#define RX8901_EVENTx_CFG_POL		GENMASK(1, 0)
+#define RX8901_EVENTx_CFG_PUPD		GENMASK(4, 2)
+
+#define RX8901_EVIN1_FLT		0x22
+#define RX8901_EVIN2_FLT		0x24
+#define RX8901_EVIN3_FLT		0x26
+
+#define RX8901_BUF1_CFG1		0x27
+
+#define RX8901_BUF1_STAT		0x28
+#define RX8901_BUFx_STAT_PTR		GENMASK(5, 0)
+#define RX8901_WRCMD_CFG		0x41
+#define RX8901_WRCMD_TRG		0x42
+
+#define RX8901_EVNT_INTE		0x43
+
+#define RX8901_BUF_INTF			0x46
+#define RX8901_BUF_INTF_BUF1F		BIT(5)
+
+#define RX8901_EVNT_INTF		0x47
+
+#define NO_OF_EVIN			3
+
+#define EVIN_FILTER_MAX			40
+
 enum rv8803_type {
 	rv_8803,
 	rx_8803,
@@ -66,6 +96,50 @@ enum rv8803_type {
 	rx_8901,
 };
 
+enum evin_pull_resistor {
+	no = 0b000,
+	pull_up_500k = 0b001,
+	pull_up_1M = 0b010,
+	pull_up_10M = 0b011,
+	pull_down_500k = 0b100,
+};
+
+enum evin_trigger {
+	falling_edge = 0b00,
+	rising_edge = 0b01,
+	both_edges = 0b10,
+};
+
+struct cfg_val_txt {
+	char *txt;
+	u8 val;
+	bool hide;
+};
+
+static const struct cfg_val_txt trg_status_txt[] = {
+	{ "EVIN1", BIT(5) },
+	{ "EVIN2", BIT(6) },
+	{ "EVIN3", BIT(7) },
+	{ "CMD", BIT(4) },
+	{ "VBATL", BIT(3) },
+	{ "VTMPL", BIT(2) },
+	{ "VDDL", BIT(1) },
+	{ "OSCSTP", BIT(0) },
+	{ NULL }
+};
+
+static const u8 evin_cfg_regs[] = {
+	RX8901_EVIN1_CFG,
+	RX8901_EVIN2_CFG,
+	RX8901_EVIN3_CFG
+};
+
+static const u8 evin_flt_regs[] = {
+	RX8901_EVIN1_FLT,
+	RX8901_EVIN2_FLT,
+	RX8901_EVIN3_FLT
+};
+
 struct rv8803_data {
 	struct i2c_client *client;
 	struct rtc_device *rtc;
@@ -558,6 +632,292 @@ static int rv8803_nvram_read(void *priv, unsigned int offset,
 	return 0;
 }
 
+static int rv8803_ts_event_write_evin(int evin, struct rv8803_data *rv8803,
+				      enum evin_pull_resistor pullup_down,
+				      enum evin_trigger trigger, int filter)
+{
+	int ret;
+	u8 reg_mask;
+	struct i2c_client *client = rv8803->client;
+
+	/* according to data-sheet, "1" is not valid for filter */
+	if (evin >= NO_OF_EVIN || filter == 1 || filter > EVIN_FILTER_MAX)
+		return -EINVAL;
+
+	guard(mutex)(&rv8803->flags_lock);
+
+	/* set EVENTx pull-up edge trigger */
+	ret = rv8803_read_reg(client, evin_cfg_regs[evin]);
+	if (ret < 0)
+		return ret;
+	reg_mask = ret;
+	reg_mask &= ~(RX8901_EVENTx_CFG_PUPD | RX8901_EVENTx_CFG_POL);
+	reg_mask |= FIELD_PREP(RX8901_EVENTx_CFG_PUPD, pullup_down);
+	reg_mask |= FIELD_PREP(RX8901_EVENTx_CFG_POL, trigger);
+	ret = rv8803_write_reg(client, evin_cfg_regs[evin], reg_mask);
+	if (ret < 0)
+		return ret;
+
+	/* set EVENTx noise filter */
+	if (filter != -1) {
+		ret = rv8803_write_reg(client, evin_flt_regs[evin], filter);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int rv8803_ts_enable_events(struct rv8803_data *rv8803, u8 enable_mask)
+{
+	int ret;
+	u8 reg_mask;
+	struct i2c_client *client = rv8803->client;
+
+	guard(mutex)(&rv8803->flags_lock);
+
+	/* event detection interrupt */
+	ret = rv8803_read_reg(client, RV8803_CTRL);
+	if (ret < 0)
+		return ret;
+
+	reg_mask = ret & ~RV8803_CTRL_EIE;
+	if (enable_mask)
+		reg_mask |= RV8803_CTRL_EIE;
+
+	ret = rv8803_write_reg(client, RV8803_CTRL, reg_mask);
+	if (ret)
+		return ret;
+
+	/* events for configuration */
+	ret = rv8803_write_reg(client, RX8901_EVIN_EN, enable_mask);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static ssize_t enable_store(struct device *dev, struct device_attribute *attr, const char *buf,
+			    size_t count)
+{
+	int ret;
+	int i;
+	unsigned long tmo;
+	u8 reg;
+	u8 reg_mask;
+	struct rv8803_data *rv8803 = dev_get_drvdata(dev->parent);
+	struct i2c_client *client = rv8803->client;
+
+	/* EVINxCPEN | EVINxEN */;
+	const u8 reg_mask_evin_en = GENMASK(5, 3) | GENMASK(2, 0);
+
+	bool enable = (strstr(buf, "1") == buf) ? true : false;
+
+	/* check if event detection status match requested mode */
+	ret = rv8803_read_reg(client, RX8901_EVIN_EN);
+	if (ret < 0)
+		return ret;
+
+	/* requested mode match current state -> nothing to do */
+	if (ret == (enable ? reg_mask_evin_en : 0))
+		return count;
+
+	dev_info(&client->dev, "%s time-stamp event detection\n",
+		 (enable) ? "configure" : "disable");
+
+	/*
+	 * 1. disable event detection interrupt
+	 * 2. disable events for configuration
+	 */
+	ret = rv8803_ts_enable_events(rv8803, 0);
+	if (ret < 0)
+		return ret;
+
+	/* for disable no configuration is needed */
+	if (!enable)
+		return count;
+
+	/* 3. set EVENTx pull-up edge trigger and noise filter */
+	for (i = 0; i < NO_OF_EVIN; ++i) {
+		ret = rv8803_ts_event_write_evin(i, rv8803, pull_up_1M, falling_edge, 0);
+		if (ret < 0)
+			return ret;
+	}
+
+	scoped_guard(mutex, &rv8803->flags_lock) {
+		/* 4. enable EVENTx interrupt */
+		ret = rv8803_read_reg(client, RX8901_EVNT_INTE);
+		if (ret < 0)
+			return ret;
+		reg_mask = BIT(5) | BIT(6) | BIT(7); /* EVINxIEN 1-3 */
+		reg = (ret & ~reg_mask) | reg_mask;
+		ret = rv8803_write_reg(client, RX8901_EVNT_INTE, reg);
+		if (ret < 0)
+			return ret;
+	}
+
+	/*
+	 * 5. set BUF1 inhibit and interrupt every 1 event
+	 *    NOTE: BUF2-3 are not used in FIFO-mode
+	 */
+	ret = rv8803_write_reg(client, RX8901_BUF1_CFG1, 0x01);
+	if (ret < 0)
+		return ret;
+
+	/* 6. clean and init for BUFx and event counter 1-3 and trigger cmd */
+	reg = BIT(7) | GENMASK(6, 4);
+	reg |= BIT(0); /* CMDTRGEN */
+	ret = rv8803_write_reg(client, RX8901_WRCMD_CFG, reg);
+	if (ret < 0)
+		return ret;
+	ret = rv8803_write_reg(client, RX8901_WRCMD_TRG, 0xFF);
+	if (ret < 0)
+		return ret;
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
+	/*
+	 * 7. enable event detection interrupt
+	 * 8. / 10. enable events for configuration in FIFO mode
+	 */
+	ret = rv8803_ts_enable_events(rv8803, reg_mask_evin_en);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static ssize_t read_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	int ret;
+	int ev_idx;
+	int num_events;
+	unsigned long long time_s;
+	int time_ms;
+	int offset = 0;
+	u8 reg_mask;
+	u8 data[10];
+	struct rtc_time tm;
+
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	struct rv8803_data *rv8803 = dev_get_drvdata(dev->parent);
+
+	guard(mutex)(&rv8803->flags_lock);
+
+	/*
+	 * For detailed description see datasheet:
+	 *  - Reading Time Stamp Data (FIFO mode)
+	 */
+
+	/* check interrupt source is from event 1-3 */
+	ret = rv8803_read_reg(client, RX8901_EVNT_INTF);
+	if (ret < 0)
+		return ret;
+
+	/* CHECK for EVF bit */
+	if (ret & BIT(2)) {
+		/* clear EVINxF 1-3 */
+		reg_mask = BIT(5) | BIT(6) | BIT(7);
+		ret = rv8803_write_reg(client, RX8901_EVNT_INTF, ret & ~reg_mask);
+		if (ret < 0)
+			return ret;
+	}
+
+	/* check interrupt source is from event 1-3 */
+	ret = rv8803_read_reg(client, RX8901_BUF_INTF);
+	if (ret < 0)
+		return ret;
+	if (ret & RX8901_BUF_INTF_BUF1F) {
+		/* disable interrupts */
+		ret = rv8803_read_reg(client, RV8803_CTRL);
+		if (ret < 0)
+			return ret;
+		ret = rv8803_write_reg(client, RV8803_CTRL, ret & ~RV8803_CTRL_EIE);
+		if (ret < 0)
+			return ret;
+
+		/* clear interrupt flag */
+		ret = rv8803_read_reg(client, RX8901_BUF_INTF);
+		if (ret < 0)
+			return ret;
+		ret = rv8803_write_reg(client, RX8901_BUF_INTF, ret & ~RX8901_BUF_INTF_BUF1F);
+		if (ret < 0)
+			return ret;
+	}
+
+	/* test if there are events available */
+	ret = rv8803_read_reg(client, RX8901_BUF1_STAT);
+	if (ret < 0)
+		return ret;
+	num_events = ret & RX8901_BUFx_STAT_PTR;
+
+	if (num_events) {
+		ret = rv8803_read_regs(client, 0x60, ARRAY_SIZE(data), data);
+		if (ret < 0)
+			return ret;
+
+		tm.tm_sec = bcd2bin(data[2]);
+		tm.tm_min = bcd2bin(data[3]);
+		tm.tm_hour = bcd2bin(data[4]);
+		tm.tm_mday = bcd2bin(data[5]);
+		tm.tm_mon = bcd2bin(data[6]) - 1;
+		tm.tm_year = bcd2bin(data[7]) + 100;
+		tm.tm_wday = -1;
+		tm.tm_yday = -1;
+		tm.tm_isdst = -1;
+
+		ret = rtc_valid_tm(&tm);
+		if (ret)
+			return ret;
+
+		/* calculate 1/1024 -> ms */
+		time_ms = (1000 * ((data[1] << 2) | (data[0] >> 6))) / 1024;
+		time_s = rtc_tm_to_time64(&tm);
+
+		offset += snprintf(buf + offset, PAGE_SIZE - offset, "%llu.%03d", time_s, time_ms);
+		for (ev_idx = 0; trg_status_txt[ev_idx].txt; ++ev_idx)
+			if (data[9] & trg_status_txt[ev_idx].val)
+				offset += snprintf(buf + offset, PAGE_SIZE - offset, " %s=%d",
+						   trg_status_txt[ev_idx].txt,
+						   !!(trg_status_txt[ev_idx].val & data[8]));
+		offset += snprintf(buf + offset, PAGE_SIZE - offset, "\n");
+
+		/* according to the datasheet we have to wait for 1ms */
+		usleep_range(1000, 2000);
+	}
+
+	/* re-enable interrupts */
+	ret = rv8803_read_reg(client, RV8803_CTRL);
+	if (ret < 0)
+		return ret;
+	ret = rv8803_write_reg(client, RV8803_CTRL, ret | RV8803_CTRL_EIE);
+	if (ret < 0)
+		return ret;
+
+	return offset;
+}
+
+static DEVICE_ATTR_WO(enable);
+static DEVICE_ATTR_ADMIN_RO(read);
+
+static struct attribute *rv8803_rtc_event_attrs[] = {
+	&dev_attr_enable.attr,
+	&dev_attr_read.attr,
+	NULL
+};
+
+static const struct attribute_group rv8803_rtc_sysfs_event_files = {
+	.name = "tamper",
+	.attrs	= rv8803_rtc_event_attrs,
+};
+
 static const struct rtc_class_ops rv8803_rtc_ops = {
 	.read_time = rv8803_get_time,
 	.set_time = rv8803_set_time,
@@ -732,6 +1092,12 @@ static int rv8803_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
+	if (rv8803->type == rx_8901) {
+		err = rtc_add_group(rv8803->rtc, &rv8803_rtc_sysfs_event_files);
+		if (err)
+			return err;
+	}
+
 	rv8803->rtc->ops = &rv8803_rtc_ops;
 	rv8803->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	rv8803->rtc->range_max = RTC_TIMESTAMP_END_2099;
-- 
2.39.5



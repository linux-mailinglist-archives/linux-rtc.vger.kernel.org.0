Return-Path: <linux-rtc+bounces-5786-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E73CAD3A3C8
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Jan 2026 10:54:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4756130925AF
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Jan 2026 09:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89DB309EF7;
	Mon, 19 Jan 2026 09:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="0zX1DlDo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021104.outbound.protection.outlook.com [52.101.70.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00FF3093B5;
	Mon, 19 Jan 2026 09:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768816320; cv=fail; b=MEmnkjQIIEa7GDdPjtAVSZH0lJamzdGNgksQ2UhRp3FMujMraFJjYV3lwMEN9pKSDlvF/44zhc7RhBa1zMkjZWJ6Ud5AgEES2ogoSMC+7/zgN4NVTiwLq2ZELzW9E8Y9LVWAxExTCVkiv7gs9GES1DjXIIC5kaxaqB1Naw+Gl2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768816320; c=relaxed/simple;
	bh=WIUV6gtXpnRSc1b+L2m7mZ4fgr3sSYKigzoW4c1IPKU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DlBVjZB60m4q9l57BQ9XuQqGXhZS8p0tWyyadcGgeyQ7DqGwlFWLxPywIGHgN5ZgAqlCefJpxceBfCdRXbpf/NqMoa2hR5JZ2gau1jiSp+f7jxXzY3C8NIAR96J2AFShGxv+8G32O6ZTEwQuWwAyFmcQZAsvXApVe4iIEY9NpTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=0zX1DlDo; arc=fail smtp.client-ip=52.101.70.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHwIAUORI8ymIP8pJjlfKyQ35m3kQNIgDyUHwyBghvZ/fK208rWmd3MeDYZ1mdmVKgarIJ8EN3x34pAvpvD/51QzGJg8Yu3vevdVZZ0mW5R2GkqTmatJqm0qOfBftUpR0qkFP3y9MnlLg/8BoW251/5nb1rBQUaxPoM2H/nFlImwnvplQevsMNR3SECdfwhRHu4X4CGLqanCsijx6GrXQo/7rczHegd6KVbPDX2Mmi4yiln6yBYTCZ88X5MFbSQM52BuKbKcioRDvIrewjtRE7pduIrBrfmLCi4MfuVlPegET/tzl/h/lJ1FZ4raFQwSY+Vf4i0bQqO4xzyeReSyew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMPOrwR7I8ME0pu1gBh/deCP6YTis9JGHg0dOhqpb70=;
 b=Ryj3XUPVJH7RYQkOOlDiamSFSxRb4ympDMHvpF9vvmg0Bh/6w5Rii9nPeumt90//Kju6zYzWZwR1lFqKHAjps0yVp8KWS8uVxnpRSBSTWax1Nov7lQOPz9ZgwU7nhaK+muyUizqkjNhrRGRM0QxyjnMKCYZSaD6syAG/29+0CyqKaehVtfOk7cFU5lZgGk7bwzzN6HwGfBmFKRZY/+l1Muse8m+/kHLGjK2ISwOp6q1Ev3dL3xH614nQNZlBWBWjv5Ghrj0jxsbN8CuWORJQoTb58fPiEDulEKN6SmHru0hcm0jCA8mD8IT62ndWKyU5/5oFh7RuqBNNDIvIvFvSGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMPOrwR7I8ME0pu1gBh/deCP6YTis9JGHg0dOhqpb70=;
 b=0zX1DlDolz+ldKEKxWuyn6U4tjgQuvGqupw4S3pe01p9jCi19wvH+5FhpN5neBSCO263SIZVkz3cwlaZnlU5fa6SnZMIwk3XtOh2ud6EZdHkFMyXJyDxgfFHsOBwqrAIt/KJPKqhxZuTFTShCOu7pN91hjqMueKbbc4V/78TRIhEp26S3+l85fxt7VzS8AadLr+erlTmDWYDLiRHIJIA682aoa7fkvgEdxTpQ2PMfL7MUW3uovw1T5AeCAPiV/1bRbyJELPg9WOa5khWOnUQ9jHEapsGGxQMQzWGozxzfI7ZUxIohbDdxg/KnGzPaBLser8UEnXDLf3w6zieUGMO2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by VI1PR06MB8902.eurprd06.prod.outlook.com (2603:10a6:800:1dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Mon, 19 Jan
 2026 09:51:48 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9520.009; Mon, 19 Jan 2026
 09:51:48 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
Date: Mon, 19 Jan 2026 09:51:27 +0000
Subject: [PATCH v3 1/6] rtc: zynqmp: declare dependency on arch
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-zynqmp-rtc-updates-v3-1-acd902fdeab1@vaisala.com>
References: <20260119-zynqmp-rtc-updates-v3-0-acd902fdeab1@vaisala.com>
In-Reply-To: <20260119-zynqmp-rtc-updates-v3-0-acd902fdeab1@vaisala.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tomas Melin <tomas.melin@vaisala.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768816307; l=864;
 i=tomas.melin@vaisala.com; s=20251125; h=from:subject:message-id;
 bh=WIUV6gtXpnRSc1b+L2m7mZ4fgr3sSYKigzoW4c1IPKU=;
 b=iaCJ4UC5CYufsGrL6/pjR0olH1BcvT/xROaD8ljV3fw2tM1bgwl5MnGVyTI+/XwD7Fa7m0yem
 kLjmqG8cpjDAKfu8vKS0NxOF2tTMLOlJjB1dV6QgfKZ8xPVfL2c1JOy
X-Developer-Key: i=tomas.melin@vaisala.com; a=ed25519;
 pk=6lMiecjZ+OeyZuxYsDm/ADy9D1JKvYrKdsYv58PMepU=
X-ClientProxiedBy: GV2PEPF00003827.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:5:0:6) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|VI1PR06MB8902:EE_
X-MS-Office365-Filtering-Correlation-Id: 90e0d3eb-302c-4e66-6255-08de57405cf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZFQzVC9aVU1SQzhxRDhyd1oybWxzZG5rdmcxRDV5UjExblg3ek1QcW81V0lT?=
 =?utf-8?B?R2NYWkpab0dRdFY4SEtFZGJySGFyZHhJWTY0Y3I5K0hYQWpXdE1uajd1Mkhr?=
 =?utf-8?B?VVg1TXBlamV5Y056SEdJNVNzR1hVV2t4ZzFpTjlBaTNtbFdCQi8vVE5aSXF4?=
 =?utf-8?B?TWd3bmUwWUpqdFJkWldIamZyOTFXUFdwczBlTnNRN3NZNEtlVmhFWFdPNkJI?=
 =?utf-8?B?cFE3a2QyUWpzZndNcVV6WE8zcDd4aklNWTcwNjFoRTFWOC9seEZ1V3FjWk9N?=
 =?utf-8?B?TnVHUkJ6T2NTbmZzemRNNWxrQXJyOVBOdjhURnRtZVJ5SFc2K2IxTGRtM0dx?=
 =?utf-8?B?TFJRTkZTNndQQ01GL0NHek1xcFVLOEM5cUNHeXhkMUVlT0NsdHVUZW5rVmdQ?=
 =?utf-8?B?YmFOU2VpTDExb2Q4L2RvQk5rTFp0cC8vZWFHMk5zbkpBWnNQV3lId2phd09o?=
 =?utf-8?B?MnY3S2g4Z3kwSHB0SVZCWTlSdURNbHRMQnR5UnBPWHV6VW1WZkplRGowWGFU?=
 =?utf-8?B?VitHYlhHTUVJUUU2bmgzWWUvbkd5cFZPMzFrcEl1QWsrNlVlTGQ3NVdxWkJH?=
 =?utf-8?B?R1ROQ2hRdmk1WUpqREFuVHBXRGZlT2p5MEZkRGFGL2ZPYlB1U0ZuNSt6Nm9J?=
 =?utf-8?B?OW54Y1lJdHdYZmorVUYxZ2MwVGVXakovcnc0bkJEVk9kWmQvbFZicGgwYVd6?=
 =?utf-8?B?azFmWmZFa0JhU3Y5QzN1eGNRdW5yejJWQUZVZE9HN1NWTjB3cUVJaG9EVXNQ?=
 =?utf-8?B?SHVjK1pTanpvamFka2RHakpmSjFhSkFvR3h4cThmRjZwME1uVThvb2xzUnFI?=
 =?utf-8?B?NVJpQVFPRHNlWG8rT3c2N25BVDNiekRkTEdnanpMNVEyTkZjY2x2dEdDbjEz?=
 =?utf-8?B?ZHJ0Z1ZHdEVTNmJBS3ZNVks4RWxreDVOaW42UE1mZnkrTGM2bG5uQnhhT2My?=
 =?utf-8?B?Rzg1dk4zQUNlSjF6a29xMXpjRGpXL1d4aHFoUk9wY3dRWXk4WXhxUnI4S2g4?=
 =?utf-8?B?NU5Tcm9NY05nYVF5TFEyalRZWmxsdCs4VGtZUkl5T3dxUTQ5WmI3THpXRnNY?=
 =?utf-8?B?dGdQajZiNXBuSFR5UjQ2ZDhldFRKNnJQTzNIbzBCaFJkL3RmeWt5WEpiQTJT?=
 =?utf-8?B?RlRKODQrZkFRbUpoRm9QOXRaeEgvY00wWE5xbHV0Q3lTb3daMWFlSzFLWHU3?=
 =?utf-8?B?eTRDWE84ZW9lUU8zSTIvZW54cGh6bWVvKzhPMlRZa1lDRnROLzFYYmpneUFF?=
 =?utf-8?B?bFJVeFFsL2dvT25aTEFEUUtoMm9vWnRZdDR2SHNBL0JXL2xCTnZrT2FzOVRJ?=
 =?utf-8?B?Mi9qV2tHUENScHV2N3NnREJKeWNZNVhPYXFsWm9RbkR5bGhLeUtXRzZ1YWYx?=
 =?utf-8?B?TGVLRWMyckNlYW1rK2dwK096VytwODNkRWZ5YUdMN1pTK2I3Y1c5SEJ3K0ls?=
 =?utf-8?B?Zld5dk81YnJCSk5ReFFOeGFpMktnMk1TT3lkRU1VUUlnTkU4OWI5bjhoRDBi?=
 =?utf-8?B?d2l1SzNrVUNYUTlURzVVYldDT1R3bjIySyt5c09SSXdmb1FIZFFLeFQrd0xk?=
 =?utf-8?B?RTlQQm4yMTIyMEgyR0JIcU4wSXY5RW0xRGdVVHpYMGpRS001ZXRJcDlvU2k1?=
 =?utf-8?B?TVl0d2VOMndLQXVEYkErZUFtOEl5WWFzNTl0cTFqbzZTQ0tBWllqclhsb0FT?=
 =?utf-8?B?eGtFZHQ4SXFQU01lVXh1MVRSeE16VEVEdFpSVm5QTm5CWWVWQ3JBV1NIR1g1?=
 =?utf-8?B?QlZMbHRuV05xcGhnQUkydVB5MVk4NWgvUEdBOW1raE9iekl3bXNhODRXM1BY?=
 =?utf-8?B?eThJV2tHdjRlaC8rU1NEd3RYc0w0WjBqeitILzdSRURGZTlVT0xHaEVDdHRj?=
 =?utf-8?B?eHFZUTJ3bWtockRBVlJOUXBnWXd0UFNOTUU3RU5RWFlsd2RXZGo0R1hSbDA5?=
 =?utf-8?B?QkE0SDZGZG5LRXVVQkQ5K0VvUHdYb0RqcTJtazJ6L1VCNUZQcGdBNzBNVWlE?=
 =?utf-8?B?elFBa3RHdFM0aWozdkpwZU02Mkg4QnVRb3VmSi9vWWF5MGljZ2ljdFh4bjFr?=
 =?utf-8?B?MlJPdklTUExwOGZxS3krUkd2dnUreExabGJ6RmZJakRWbVh6MkhBTEI1b1Bq?=
 =?utf-8?B?b3U4UzE0WFg3THdwVjFwZDlWMmxMM0pzTlU2SnVKaFRJWW1Hamhid254QUhx?=
 =?utf-8?Q?2CwJpmB5xsBZnWgzbtvB9y4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UW8zbGExd1R1Y3BUZkJIb053Z0dkcG1GazZONEtIZkpIdkhaN2Fod1VWS1Vr?=
 =?utf-8?B?cFFLZURVSjdmYVdqQXM5Z2JPSWVrbloyM1VaS1lnVEo1cWFsalBwMEdmbElH?=
 =?utf-8?B?bU8zZjE0ZTlMVFBDd2hZaUlKTk1US0x1SVNjRmNRanJkdUloY2g3T2tmY1Vt?=
 =?utf-8?B?RkdLQW9jUHRTeXMrYWxTR2JNQlc5M2xxNm5TVzVNTkZLMVY2dGcraW9CTWE3?=
 =?utf-8?B?Wjdza05pQzlOMW1PRGJ6MStDSDdORG1yeitjSVd6S3h5VlpTeFlobWlYRERi?=
 =?utf-8?B?S2FIYzFYSUxjSGtWRlVnWXVpM0d6eWVaUXA5eEpQd2x3QXlYcEZXZmNNTkVp?=
 =?utf-8?B?eUpFUHZWaTJ2d3VTVDQ1ejhRVUlyVjVOVE1rN3ZOZkRnVytVblhhakRNK3ZP?=
 =?utf-8?B?V010ZE9MM0F4ODd3ZE93ZWt0NTUwSFZBbnkyNXlRckZYOWdBTTgvcTJHcDQv?=
 =?utf-8?B?a2sxdlpFak5OSDVFam9TeUIxQm5PYWVySUdEdXl1ZjhCUCsrcldsSC8zNjVE?=
 =?utf-8?B?eHFXZlcvMEZyMmJ4WE1rUnFQdGhtRlhwc25lVWlmR1pMaFF0a2JFVzFwZHdP?=
 =?utf-8?B?RW82dFZVK1pERUJOdGZlNkV2Yjl3R1Nzc0pZbjA0V000QklTVE1Fak5FblhW?=
 =?utf-8?B?VEl1R0wvM21HMzhHeEVGTG8zRnB3bDM1c2lJTHFpRUF2ajRDQWU5R25Pb1FS?=
 =?utf-8?B?MTA3RGZlZnpZckZUUWxKSVhrK1RGajNiVG4rME5JTmpWY2VNWFhJaWNvSStv?=
 =?utf-8?B?MWR3TUMzOUVyb3VxTFBQaFVaZXA2d2ZBeXdCZ2hRR2JnVFNHSS84Z2RkbEhM?=
 =?utf-8?B?UkJtbjdTWHdTRGdzL1VNUHNaem5qeUZzemhhRHlJTnZtV0tSQSt1SmlwTTlW?=
 =?utf-8?B?K0pTc25WUDgzelJIYk91cmk2aHF6am1KazZDS1kvRUFUbC9FUitsWHJ4cDFp?=
 =?utf-8?B?V3kvd2FIMXQzb3l1K1h5RTA1dExqUkVrQnlWRlVPUUdXWVBwSVJXM1NEUllr?=
 =?utf-8?B?WkUxUmx4a2lBUHZVNXp4RlBKeURMYUxnckV0YzlHM3FqN3FXM2NIN0xIbVgy?=
 =?utf-8?B?azRZVk9WVDFrM0NwS2hvQ2NHbXpsV2hLRVl5czJMOUlpSTRybXJnR2QwZEFN?=
 =?utf-8?B?NEwvTzZGWWdNenprSW9MSVl3UHc1dnY4RklmMjdxYzhoUllna0tSdlhsMFk2?=
 =?utf-8?B?R3VyT05HRmprQU5vaVFQdzFtdEx1WUxQQWZ2bFEvK0lwZ3M0VFNJTWZVb0di?=
 =?utf-8?B?bkQ1c3JkSG4zT3dneWZmVkNhd2E5RERNaDkxMWQraGxwcUVXTHZMT1FTN3VP?=
 =?utf-8?B?L25yY29PVGl2UzQwZlNXSVNMa2lqR01VRzJIRDEvOVNETFNxRWJSUE1RTXlu?=
 =?utf-8?B?bml1T2NkaUFVUVZqOEdlTUNDQTZ5OE5OUEE1anlUT2NEWEg5T0tQYjdodWxU?=
 =?utf-8?B?cllYaHpJV0RYS2hXZS9Nak9PazYzMHBYK3FkNXhRb3Raa21kYUljRU9Fby9i?=
 =?utf-8?B?NE1NQU1va1Y5VGVUVU9BT3ZSMjlycVBnK0FBb0dyVUNTMExRSW5HTzVQUVd4?=
 =?utf-8?B?czFyMUYrbERmcmN3QUVtOXdCckx0V1FONFZqL3lFUFJnY0NnblQ3RCtVbFBR?=
 =?utf-8?B?VTRhVjF1NllubHgwWGNFM3F4Yk0vNmZ3Wko0Ky9XZmlMT0dtR1M2b2VtZS9K?=
 =?utf-8?B?Y0ptWFlvMXUxZWd0ODJUamRZZHNxb0ZScGxoK05XOUhsemR5R0hsNTNjbXp2?=
 =?utf-8?B?cmVmQ2lJaTl2RXE1bnJUUS9PK2lGNTRXNC9yYUdQSUVCU3BTeXJyK3RIRTQv?=
 =?utf-8?B?UDVXQ1FMaFlyRXcyTUpzVHc5d0dmRGxwVXN4K1JNOVkyd0RWYVNSSDRvaDMv?=
 =?utf-8?B?ZW9aTjdFV0t2eFBiWkVMRSszR041TENtaEhzWW4yc1g4VUNYWTZQazVua1Y0?=
 =?utf-8?B?d2RPUTQ4WjdxRlRMOGVMenprTXdjaHBLV040NWc0R2lEaFUrWFZjVUlNTlFF?=
 =?utf-8?B?NW1BbzRDdHdwVEIvSUtZelI4QlA2RkJOMWN3MWtFUm5JWHB5MWkyZXYxaWZS?=
 =?utf-8?B?QndTdzFFQ1FYUDQ0cEhXVGxaVTlrelViUFRQWmFjaHpzL3IrdktRQnZaL2l2?=
 =?utf-8?B?ZTBhVk9pYytGZ2UwNE9JSnlXcjJNSW4rMW5VK0lVYTg5c09OT0tMYkV1bG8w?=
 =?utf-8?B?Ty9lUFAwbkl0UG5OS0JmdG9GaHZYbFFkZGdNY1hETTg3Z09iOStSOHR1S2hR?=
 =?utf-8?B?VUJqK3ZsY2pLWENpckVSVzE5Q2F5NjQ3elNBV1hwVGQwa2h5ODZoUlRBU3Zk?=
 =?utf-8?B?RHU1emcxZzg3eHprNy93bTEyMWx1S0FTQUpaOUw4Yzd5Zk14ellxcW12ekJ2?=
 =?utf-8?Q?HI/zLYvC2Hhm4vbA=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e0d3eb-302c-4e66-6255-08de57405cf3
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 09:51:48.3142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AbGZfNllv2NrOzSletn5WMgEfqMP53aCtj8wHOIzKlpKw4N9JXYAURlKkgqCQh5wWJEJZEFIONQ70P0vG5HMUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB8902

Driver is compatible with RTC controller found on zynqmp.
Configure dependency to enable building only when zynqmp architecture
is enabled.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
 drivers/rtc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 2933c41c77c88e60df721fe65b9c8afb995ae51e..46b497524cbfb5d0c1662dcaddbb6d28b4ae2abe 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1376,7 +1376,7 @@ config RTC_DRV_OPTEE
 
 config RTC_DRV_ZYNQMP
 	tristate "Xilinx Zynq Ultrascale+ MPSoC RTC"
-	depends on OF && HAS_IOMEM
+	depends on OF && HAS_IOMEM && ARCH_ZYNQMP
 	help
 	  If you say yes here you get support for the RTC controller found on
 	  Xilinx Zynq Ultrascale+ MPSoC.

-- 
2.47.3



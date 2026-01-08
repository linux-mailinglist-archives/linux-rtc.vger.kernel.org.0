Return-Path: <linux-rtc+bounces-5694-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 866C2D03384
	for <lists+linux-rtc@lfdr.de>; Thu, 08 Jan 2026 15:06:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7B7F3133ACA
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jan 2026 13:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C11843C040;
	Thu,  8 Jan 2026 12:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="gOz2Fhaz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020078.outbound.protection.outlook.com [52.101.84.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30AF3BF30E;
	Thu,  8 Jan 2026 12:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767876698; cv=fail; b=kixm6EqGNMUKYwkuSzQZIhHYTK2pEiD6DjY/v09b1TbiiSRlZcV7ApxeSuRyrMW6AvPbICv2L1YgcjHSUW9IavHDYiV8cBgdzTOM5vA93F9w4L2bg2C6gYvSXv7zacU83jm0JEOEpxL6m0MvHTXhFGHR44tk8XXnONjkjWiLKQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767876698; c=relaxed/simple;
	bh=IOFDRi6Blk6L6qZDwIWMIzkws7XoiW5XjcvXiFoozJ0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ugtGezF4VJ2Pk7YboiH+/KJejWUcYsAWy7pOJKBKsBziHXyWRr8BLUKFgxuP9U8lish1tEkeAG1kZtFTw3kZxVB2lQyur8UQR4KO2Dri33NpralLAsaesdQAOnzbWFM9oJKQcc8FOEMJ5d9bk1u1FPq0L0Pt4BXoopfiZqmaV/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=gOz2Fhaz; arc=fail smtp.client-ip=52.101.84.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FKdFvx/bqX4yGTYFJKkBphfYw6r6v6+CaQzIePVEgRTc4Wa+gohGvrjGUSdBJLy+DVxtpIZOwZqu3k5qro4250M4AtIHTPMExRKvdxNTL11xGeoR/n3ayAV1HHVwYGM05/bhElVcT1UoM4/7id0CbzvCV2PNtSCQdYwp4lcd4kkN4zIXlm7wtRxm+8Kngf8Gz4nQxz6MqLV0i7ga7EtLOSyTI1fA1ArbqErvrKkAFJ50SFSHwtQfaJK3HwPP0TG01RWWFkxt2KzZTLjCFsvU0huArBznfpz/5gZycYvOuorHK4uDNBpyr1b+SjF1S1DVJ0+gQgTjNF7sLyTMoOFOGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gT+9QmEB90+Tk5DbxhEIOd+fW5LXYAe2qOhoYyop0oc=;
 b=aqkeHqEm+La1C93ZYGgBlwwQNbwBExNEzq8s2X0uKP4rR/aEM3tdHKmYRufgTedbfdUR0UTNSJ6dSWVVMczcZWnp1p1gEB16Gh7muWoRJpJZ1LMGf8Buous9/qRkYqNCGXmh4k7z7alBafWEoCzG4iBt3pkTQTzChoM7JTdJQGJzmqcNNBar+44RtFNWC69EL8Kwmdf9CFZ8/jt6e6jYA54buQB/2XtmKtk+MAjANyHrFs+rNL7kkOGZOd54kut/3GCH7168h77K1SN9HfdY5PajIRdQUwhT17urGItR2BszJ5fkNgX7pQHGaHm8MnK3cOKOPT5rRwJxjI4HwNiD9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gT+9QmEB90+Tk5DbxhEIOd+fW5LXYAe2qOhoYyop0oc=;
 b=gOz2FhazncYd5302QOh+4zmwnJ+o1aSpDec4D7e8XqfABup6saqBTsCWGS4p7/rPa0EVzZ9B59eplwETDj5LFz5BTOe78hyN02hG7UPBMKQwhGKHvGdUeTgKMLIxz3J16FtFR8IAQy0W3auIBK3A0gZk3BjBgy1e3DJU12u6UCSSFYVlt7eyA8rW4F7dWWZaPWOfBnfTaKCrA4/Ku1IB3Ori3pz6EI9BuyU3Fxx/wx0abEdYAwEjigTQQyHlqM5+k0kdnIbBmjZkw6cL5ZxaWXEGjG64UiOP45+BgoC7yHbzpU/+a8aciKiEwAhWFmD3WaIplflno9GSVEeHZQz7Kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by PAXPR06MB7456.eurprd06.prod.outlook.com (2603:10a6:102:151::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 12:51:28 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 12:51:28 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
Date: Thu, 08 Jan 2026 12:51:14 +0000
Subject: [PATCH v2 3/5] rtc: zynqmp: rework read_offset
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-zynqmp-rtc-updates-v2-3-864c161fa83d@vaisala.com>
References: <20260108-zynqmp-rtc-updates-v2-0-864c161fa83d@vaisala.com>
In-Reply-To: <20260108-zynqmp-rtc-updates-v2-0-864c161fa83d@vaisala.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tomas Melin <tomas.melin@vaisala.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767876686; l=2116;
 i=tomas.melin@vaisala.com; s=20251125; h=from:subject:message-id;
 bh=IOFDRi6Blk6L6qZDwIWMIzkws7XoiW5XjcvXiFoozJ0=;
 b=BksgKNBa2S5mEC7XlVux4jx+k45wix5ZprHnoYteugd6vTs5ylcWfZdMcTN0hwf6l8YvEndhl
 6kac/SxAIjTDJURnKPMZbri55FkMVp+5mxyu/Yi3nNhsTp7SDASQxeX
X-Developer-Key: i=tomas.melin@vaisala.com; a=ed25519;
 pk=6lMiecjZ+OeyZuxYsDm/ADy9D1JKvYrKdsYv58PMepU=
X-ClientProxiedBy: GV2PEPF00007567.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::3e5) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|PAXPR06MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: 15ed4593-8d99-45d5-4709-08de4eb4a3a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UGw4ejNyOThBd3V2QTZsajF4VGFRUGdYcEVwZW9jME8yOFVFaWd5eEdYK1BR?=
 =?utf-8?B?RXgzU09WY3RVUDZzWVFLbHMwSkNHN3FFZXF3WXFIZEw0OHI4MmJ1Q1dINHpO?=
 =?utf-8?B?czJRd2ZCZWx2ZzM4ZGJ6NTNkS3VIR1crV2xwS3gxVkxReU9uWEdKWFVQcnJR?=
 =?utf-8?B?QlQ3dFMzdW1VSmcvUUl6MHNQNitBL3NSa0c2RWtBUUtaeVJyN1JNUzczNmcx?=
 =?utf-8?B?TzBxVGFaWDlzMzVOcmFkUkg0TXhNTzNoblFvVTJHSmpnK0pmdTdwbGhQRzd5?=
 =?utf-8?B?ZnpoZVBsZTFMYnYyNWJlQ0tFL1hFL1RpZmxKSmx0QkhUaDkrTGl2QWdNNDRL?=
 =?utf-8?B?aFk3ZnNaeFVvUFFqcGIyb3IxcUFKb2JPN0c3N2RobG1ZMXdHczJZTDE1eW1E?=
 =?utf-8?B?cU5ZSExReGFhd2RoM0doUDRBM1laR0pPOWE1UGdUMXBFVXNiUjNpR0lEcThz?=
 =?utf-8?B?a1J2bzdxQ0pPQVBrdzU0cGtYNER1S3U5RGNDZTdHbGZUOFpQKzhzT2lGUVdo?=
 =?utf-8?B?djR5NFNtLzZncE9RU2ZaWHM3Y0pGMXNFTkEvZzlhaVlvUGg0M0Y2cFU4NFBw?=
 =?utf-8?B?eUo0Ym9xRHpEQzE4d3VGMjNtbDN6UXo4cWpCOEdCZGlQZ1F0UHRqYnNWNDRo?=
 =?utf-8?B?d2Nlek5aYW9pZG1LZE11MkV5d2UwWmx4T05tVEVqZmJ0OFdmYmx5dTVxT2ww?=
 =?utf-8?B?UE9yN1kzSVk2cTVLaHBBR2Z4cDRHWlAxTkpjOGQrbm50WFphRi9tSUtMc21w?=
 =?utf-8?B?YUFZelR0b1lpNGY5TzRoVGdLZU93c1ltVHNpSGlTZVhJWVk3WnQ2SUpoaFVE?=
 =?utf-8?B?U1R3Uy85UkVnQ1ZmRTRpMkMxbVhqVlVzQkEyY1Z5NE0wOGVuYnNaUkYrRHJ4?=
 =?utf-8?B?R2tjTVhhS0p4NFJiSlY0d1hHNWFXcW5vZHRSblE1WExyZUZpR2pBRlU5bHA1?=
 =?utf-8?B?SE5VR0Q5RnhWblZUSldINjloYytSMkxCMlZTQkx4TDZNTXlNTjlSOEw0UGJx?=
 =?utf-8?B?S0dEaG5EUENYQTRxK2o5ZmRyOFZLM1hjZEptN2Y0ejNsUGRJb3U0a2xJSW80?=
 =?utf-8?B?MnBxZU9kT052S05zQ0VOaHJoNGFKZk1UN012UWFSenB3NkNoRE1venhHSHpX?=
 =?utf-8?B?cnVBcGhMRFBxaW5HS1lOcWgyd2hHQWtJTFJOVHQzN0lSL01uM0E0ZUtxSVZS?=
 =?utf-8?B?cGVVNy9ucE5abGp0WnVWRnhpNHB2cXVGN0NrTUJPUEYzU1ZJQUhPc2hmQS92?=
 =?utf-8?B?MzRXc3JSbEM3THJEN2NHd21hTU9UL2l4ZE5EcGpHWjl1UHpjZlMzSmh3aUpV?=
 =?utf-8?B?enkvYWpjb1dUZ2tWbVVseG9LdGFTOVdNU1AzK2pabExnU0Jva2NXeXEybHdC?=
 =?utf-8?B?b1VWS1hPMDRVdi9ySVFYQ09QMTk4cmN2K2xvOHdRdkx2V29RSHRZWTIzWVZJ?=
 =?utf-8?B?cmM0c2x3ZldabVZ3VDNFNEE1bWpzVk8xVEwrMlJHaTdTcnRFQWVaYm1qcDBh?=
 =?utf-8?B?YWlLRS82eHJVb2JzbWY1RTFYYzZDalNoK1J6Y28vK2xRR01OVXNlemxaY1FW?=
 =?utf-8?B?YkcrVjZPK0pQTERjUjJId1NzelpuL2gwcHU3cVB5MUo0YWt4TEllS2MzajdV?=
 =?utf-8?B?eVdSWjhiaFU1QUp5M3daTEFvWnNwWkJsa3FKdUpRYUFwb1NwVTRHamVlUkhE?=
 =?utf-8?B?YTZXS3QwdmdMaHR4TzJYRkhrU0YvU0pCNlpielNPc0tXUFBmMHNlNG0xenZ4?=
 =?utf-8?B?MVAxLzdLTW5wcCszU1Z2R2k1S0dDaGJyK3Z4ckNOcUtJcXNhNTl3MWNGUnUw?=
 =?utf-8?B?UURYeHVIbFZkYldvay9ZR3IvbWc5ejNOdW5aczJEUjh3cCszOVh6SWNyYkh2?=
 =?utf-8?B?bU9nZ1VWeEZPNTRKcGdQM2kveDRyRkoyZUdGTWdGY3pzaXBnMktOZUN2dXVW?=
 =?utf-8?B?MmZVQ3daNlNxWHBOd3MzOXdod2IyaTFnZlZiR1MweTJhaFNRZUNNbGRKWEtn?=
 =?utf-8?B?d2M3V2FPbWFKejFWTGh3VVF0bGpCdmhzL2dhaUFHMW5VRldFNE5LbHZTM3NH?=
 =?utf-8?Q?F/79JJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?am1jV1IrdFcyRTc1eXFUQmltK0hNQnc1ZFU0N0RZT3RhbWRZRmY4eFpPWFRM?=
 =?utf-8?B?UXJMT1lkdzR6a2xkc2luVDdiZEhpaWg1ZVJ2U0kzKzhaaFVrcnQzQVB5aXhI?=
 =?utf-8?B?WEpMZmgrQXhqOEtwUkRNcERqVmt0ckJncnozUGRuSHdBcCtsMStMc0orbUc3?=
 =?utf-8?B?c0hqNnY2c3BuNWJ3QkZaSHRuak5waEdHQks5TllqTWJtMXhBYUZUcURrS01l?=
 =?utf-8?B?dWsyUEgxSHhCQ0h4UnhvTDBZVURmNTE5VFpkVDFjVU1BUXNUVmMrdXFWVnRK?=
 =?utf-8?B?dW9HTTZ2NVBoRVZHbng3aUZPZ3VZVC9KRW03dXAwTzJoODIxWnl4T0VPUFBV?=
 =?utf-8?B?QkwwbDlkYlgxUVhuaHZwSDNKbC9WengyVXNVRXB3TGFqSlYxYXFXM01URXRu?=
 =?utf-8?B?cTJyQi9JWUh2ZC8xZ1UvQXBIVnVFMDJYV3FtM2dVc0lZK0VPMENmaUIxc0JN?=
 =?utf-8?B?cWtqUFNrcC9hNWxySm1jRVB0Wm5jQmw4TE9LMUxEc3N2Wk5MNkFobkExdmhG?=
 =?utf-8?B?YkxWcnJ4R21MR1FoQnNSZlhHR0FlTjcwdHNiWk1WdnRLcnhpMkM0R3pubWFJ?=
 =?utf-8?B?UTNEVE05R2ovdXVEOUFIZHZxN2Y4UStTZE1PZUdPbVNzN0pXWjE2a0JjNlMw?=
 =?utf-8?B?MkJ6bnh5S0dWeSt0WnB0a1puc1hBajVGdjJMU1UwMEh0c0dlTzUvNzdMN2NM?=
 =?utf-8?B?VjBDTWpSZmRqdG5YSTZPZzhLcTd5S0wxQmthSXRXYmpka014alpzVTA3cmk4?=
 =?utf-8?B?YUMyUG1UT2t3NGV3L0dVd29mS2x4SlhHWUdIUCtPaUhmNkgvcGtGVnVFaXZ2?=
 =?utf-8?B?QlFscGFKeVhPbGhtVHJPNGJ2VFdpY1RrWm5ZZEs4cElvTys3ZnBEZzA3cXVu?=
 =?utf-8?B?K2w1czhDL3pnOEdueGNjM201YnpaOXNoOCtYcmVESlFJQlQ5V3lxK1l5UDNl?=
 =?utf-8?B?UDdYb2RwSDkybGRrejJwaG1JN2ZHajBkOW1vZUdlQldpTFh1eTVHZ2l1Ykky?=
 =?utf-8?B?K2orSWEybHM2MnY2ZFJhWHJCR0w4RGxrZ0I0d21nTDg1SVVtanprelBIRWNz?=
 =?utf-8?B?T3FReTZnalhLTUxtMnRrcHppQXcwQWV6d3dhWFowbmN2amc4dUQ3c0pkOUxj?=
 =?utf-8?B?dDBjS0E3ZE5lczJNTWt0b0h2S25vSytoTWZtbFlkS3MxajRJYTIxUi9RdnJN?=
 =?utf-8?B?S2NRRVdmK2l6aEo0U0RFOTE4aHA0TitIakxSNVNZZzhxVVlscGkyaEY1VjFD?=
 =?utf-8?B?ait4dGR6eHF6STVYclNwZkhqbms2OVYvalp3RmdDQzZPREVoYUN1dGwvNHA3?=
 =?utf-8?B?L1VoYzZXclkyZ3ZXMW9BenIxV2FpQjFFMmF4S1NnczBPUlNzbjdQa3BDZlRT?=
 =?utf-8?B?Yk9XaFFUZnNWSklmTzdrN01WWWwyWGdBdktjakNUTjJVK2xPbDlHSzVseWRZ?=
 =?utf-8?B?SFE5V0ZzeEZ1RUNCNkpKUGpGV1RZbkJjTGlLaGV2TE5lSUMxNEYrQW4vK2xE?=
 =?utf-8?B?NkRrZWg4b0t2SkdmRXo2eXlBMW9jVktNdU9hYlZCMlg5cTkvRjFoNEFZeFlH?=
 =?utf-8?B?Rjh4aWZ4eURYQUNmWmRDQkJraTBMSERBQlJwNHNqTWVyUWllRy9DOEo1aktV?=
 =?utf-8?B?aVdNS3VIbWlGR1A1QzdLcDlxYVFzRmhrQjFRajFLemZNdWFGQjhydnBSNUlS?=
 =?utf-8?B?dE43bGsvRHViTjJUTHN0Q09EVTlaeW9jcVBnUXNOeXdSS0hzY1pMWUhlUXdt?=
 =?utf-8?B?TFpZakZxc2NoSnAzVnJHbU9pQzUzOTFia1M2K0l3cUdUSyt5S2Y5M2o5RzVZ?=
 =?utf-8?B?MnBqd3hZY1luVlp4RkhsaktxS2IxOUtqS3RWcFhZOSswRlVpZTJrbnBHMHpT?=
 =?utf-8?B?NmdMN1ZLaS9QYmJUcVZRYXB1T0VWa2N3cHFOUTZRck51YlphOFNWU1FwSFZJ?=
 =?utf-8?B?UW1mTllub3NYL1gxemd4dWswTGhac1RydUk3Yi9NZ0tMRk5qUGpYUDI4am5E?=
 =?utf-8?B?UWVEZGVrRmtPdlIyTEJnV1hPN1M5MzdXaUVkanl4d25KU08reVRveDU2bThI?=
 =?utf-8?B?OFJ2TVg4T1E2b1B2VUcrekROY0VuSlZUd2RzcjBIOEV6UXdObVd2anpicHVZ?=
 =?utf-8?B?akxLcUNrZTNVcFB2ODI2N0pXdjNwazhGYVUrY1lGRjVZS2U5RmVuSTZBeXhO?=
 =?utf-8?B?S3h4TFQrWkhGUThEd3VkcGJWWC82d3UrMTRmc1IvU0E2cGJON0EzUlZxY3ZC?=
 =?utf-8?B?Q2IzTWZTRGZleDNrYnFqVHpKREc5R1ZoS0w3blMxeDBtZ2ZpV1UyNjZITm5B?=
 =?utf-8?B?LytQK0VDck1nZnRhSGYyWW8wd3JVa2RFa3VPOHdoUWpMM3dtc3l3M0ZkWmdI?=
 =?utf-8?Q?czwwNufRFee8rG8k=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ed4593-8d99-45d5-4709-08de4eb4a3a7
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 12:51:28.0553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TusBjHVtJrobKS3Eo+A9Qrt9xCN5qThYKCzKkfCxsEY/Pc6uuAK4a5xq2BfOiwg6JnjmqYGnplAPCQ0SqT3j/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7456

read_offset() was using static frequency for determining
the tick offset. It was also using remainder from do_div()
operation as tick_mult value which caused the offset to be
incorrect.

At the same time, rework function to improve readability.
It is worth noting, that due to rounding errors, the offset
readback will differ slightly for positive and negative
calibration values.

Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
 drivers/rtc/rtc-zynqmp.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index caacce3725e2ef3803ea42d40e77ceaeb7d7b914..6740c3aed1897d4b50a02c4823a746d9c2ae2655 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -178,21 +178,28 @@ static void xlnx_init_rtc(struct xlnx_rtc_dev *xrtcdev)
 static int xlnx_rtc_read_offset(struct device *dev, long *offset)
 {
 	struct xlnx_rtc_dev *xrtcdev = dev_get_drvdata(dev);
-	unsigned long long rtc_ppb = RTC_PPB;
-	unsigned int tick_mult = do_div(rtc_ppb, xrtcdev->freq);
-	unsigned int calibval;
+	unsigned int calibval, fract_data, fract_part;
+	int freq = xrtcdev->freq;
+	int max_tick, tick_mult;
 	long offset_val;
 
+	/* Tick to offset multiplier */
+	tick_mult = DIV_ROUND_CLOSEST(RTC_PPB, freq);
+
 	calibval = readl(xrtcdev->reg_base + RTC_CALIB_RD);
 	/* Offset with seconds ticks */
-	offset_val = calibval & RTC_TICK_MASK;
-	offset_val = offset_val - RTC_CALIB_DEF;
-	offset_val = offset_val * tick_mult;
+	max_tick = calibval & RTC_TICK_MASK;
+	offset_val = max_tick - freq;
+	/* Convert to ppb */
+	offset_val *= tick_mult;
 
 	/* Offset with fractional ticks */
-	if (calibval & RTC_FR_EN)
-		offset_val += ((calibval & RTC_FR_MASK) >> RTC_FR_DATSHIFT)
-			* (tick_mult / RTC_FR_MAX_TICKS);
+	if (calibval & RTC_FR_EN) {
+		fract_data = (calibval & RTC_FR_MASK) >> RTC_FR_DATSHIFT;
+		fract_part = DIV_ROUND_UP(tick_mult, RTC_FR_MAX_TICKS);
+		offset_val += (fract_part * fract_data);
+	}
+
 	*offset = offset_val;
 
 	return 0;

-- 
2.47.3



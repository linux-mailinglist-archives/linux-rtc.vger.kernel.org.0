Return-Path: <linux-rtc+bounces-3905-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB4BA83CCD
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 10:26:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35A924A3E92
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 08:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0206920ADFA;
	Thu, 10 Apr 2025 08:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ukJR568H"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2051.outbound.protection.outlook.com [40.107.241.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D68C1FDE31;
	Thu, 10 Apr 2025 08:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744273561; cv=fail; b=KjSP+1jZlLXdghZEDb/ce8Rkd6eR290sv9PlHJclCjZbU0X6pI9G2xnbgg7WmRptgd6X9Bm4lXDlM0SGxSytluW9Kg2HTsHRp0I4r1MfQ0gGXyu1LrlLtRN5soorZUm7RA7Pe3PI5AwK5m0460Q9KJBpqu/YpzYP2AhKigJO2ZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744273561; c=relaxed/simple;
	bh=PyuNMQD1V00UidmoYVDM5OltK6Uz9SaYbY281JMLJBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JiVc5Q+vFrJCegQ8Nayagz4er74rY5CXwGC9yaQjICCBPVX4HmUGWTmGknNRMyX0HEI+lD6UC4jwAM6RhFvRM+INkr3RnzqU9DgLYHujbGRdh6kxd5iPptwxAO3OOOOBdBf5xpKOkbS3UriN3lxQ7aemLFhPFRUJ2SgiJ4rUqc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ukJR568H; arc=fail smtp.client-ip=40.107.241.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E9qNt4x7YFjXJI2Lk9yPR0b+ZkLcBYEBFsjvhWGthy7eXCuGb8NBewiK0rBznWRoM/5cIhdGGICN9XtX/2L5hCqb44sD7VHUtO6MbOGLLUh7re/86v0uxOmAmA4e7S8EsVITuts61DNt/6sKvuzfjXHL2N+ypFREgoTF2BgcjbVt/ICJZ34ZXcWs/EhOohZXMpaWezCEoOmdZOLGgeQcT8w4lL4w2WOG2KJ+Gc6Z6LfqdVp6R/xAuKuiu7iKJz0DlwOv0WDQT5t9B5Xz4dCFblyLTR1ON/8lvemswuTvlfN18clap5opEvipV+8Kv4fPzXvsW9cQEPFu3QufNNWKgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/39FscliCVsq07aG5ncLC5M0UGjJ9IFqPTRpm5+RlmQ=;
 b=YRVQxACZQTVbklDPWyua1XNZKFcMlUdbcJ9Ug7r/wZJ+N0qH7wV/BTXtWFt9+mOfbGf8yEzTJxbLAKferlnSmlIOZrHco7fzBB5b64/Nv7SSoz/z8Xbw6elc4buP9B3QQrJJAs7vFvjgiZm68LviBczWRDP7YdknDV+2Vl/I+BR380Nn1ymX18isRAYVS3JNElXAfHWvA31sej+V53LQE9nDd61RgdnGnsyVDk24aRPHsTnWKCHTHxuida1++tm7a3fCa70oGxZmCoV8bTz5NbBgq0Nve+cT+ASH1XMdOCaERUWp48rDagifHxVgVPVfyJtQZXx9aW6RQMGVddBhcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/39FscliCVsq07aG5ncLC5M0UGjJ9IFqPTRpm5+RlmQ=;
 b=ukJR568Hio6JvPsTalwaCR/4o934KQJb6F+oKwJyCOH9x6bxCPa4PMnVSO7dlVZ4550z3zsA92GKsS6OnvgSZRN+yKwfl6CzV4PZmmioxaUdp5nfo7CcvEH+Hm7EK0L/NqiMc4mp8pZ3UKxXNI8uTiVLrEc8sn9sFQlZmjF9u/vBLC8iZarU/VFfCySATplHbI0HSyzXss2H8bVTg2dV9xvUAhgMThThOL6n9O7sCbGp9T7Nv2CSQTiJiGMTXjB5coEyO5GZppX8+bvRU8CHYwhZadpchEuLL3+r3YdYOkrQO+3+cIupetqQb+MZaaTRbjpxrYP0rE8UYTPj+YSfbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AM9PR04MB8858.eurprd04.prod.outlook.com (2603:10a6:20b:409::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 08:25:54 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 08:25:54 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	s32@nxp.com,
	imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>
Subject: [PATCH 1/2] dt-bindings: rtc: nxp,pcf85063: add 'no-battery' property
Date: Thu, 10 Apr 2025 11:25:47 +0300
Message-ID: <20250410082548.3821228-2-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250410082548.3821228-1-ciprianmarian.costea@oss.nxp.com>
References: <20250410082548.3821228-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0216.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::23) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AM9PR04MB8858:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f360206-16bd-474b-6885-08dd78094f81
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WkxxeFlsdklTaFU5TnNzVW9OL3F3dE5pTVJjVmNMN3ZoMVBBVzhRTG1EOEFy?=
 =?utf-8?B?enptZDBFK0YyNVVSTkc3OEIreTFWb2xCNVh5NVNJYlpxQ2JHZlRNS3lOeHps?=
 =?utf-8?B?VXlKNGlGMTFMVzcyRUVGV05ZcUVPYVVJb2ZlUzhPbG9RMjdCUm5WcHg4UGtH?=
 =?utf-8?B?YUtyNXA5V1BRanhmMDIxekZGRjdhQllla0U5R3RKdHN3Yy9SNjRmTW10QVAz?=
 =?utf-8?B?SjIrRGVBZUZuMjVjKzJKNTVRNDZpWXFXc1hCMzVYTmo4WmltM0dteTJaS3Mz?=
 =?utf-8?B?MkhyV1VjMzltSTExY3Q2cDUrVlVlZmFoajNtcnprSGI3NWlyU3N1R2wvcW5h?=
 =?utf-8?B?TFNvNlY1MXVvd1RTWGFQeXc5ZTduRUdpUENPTlpnNnp4a1drU0g4R0JRNjBS?=
 =?utf-8?B?YXlZWGN5VTlvZkNTVmtqemgyeDVjZ1cxZTUxTG1DU0haTWhnZVpWT3pEbWRi?=
 =?utf-8?B?RnhBQWxQK3h0b1ZrK3YwWHBGRzJHR1dFTVN2UThETXlTOU1Xek0vdDZlVW5F?=
 =?utf-8?B?ZUp0aVAwVTlSTEpNSllQblN4VDR4dHAxa29JU25sUTB4aHlWNXNhaVUxeEw5?=
 =?utf-8?B?bkJ5Q2t4VFZwUnIyYm90N2JNUFFIL2MrSGFITEI1TVhROUNvcWd3VGxVRzhO?=
 =?utf-8?B?WENFUUx5ek91cUJFdnBpbzVsdGs2enR0NlVFMCt0YVh5M3FrNkc5TjFvODhO?=
 =?utf-8?B?b2tCU05wQzJRN0NaVUlVNTdMSHdSemxZMUxrRkFoY1dHdm1Sc24zR2llZGFr?=
 =?utf-8?B?a1diclhNeHZ2eHlSZ2x5LzNERHBPR2lla3VMRnNTMmJZdHVyRWNzTW9nbjJM?=
 =?utf-8?B?VVMySG42OGFzenYrM3YxRG9JbTN1a0JaL0FNaUQ2blNtQ3JIVFhMcjdyZG44?=
 =?utf-8?B?RGRHb1ZBMVBOS1BIQnI1UmxPUHc5SjZBYU5lVHlSckgvaFc3Q3JrMTBzUzVz?=
 =?utf-8?B?RTk1WjFxUG42NW1QdGh3dHFCV0krY0liWGJNVTRSSnJvMmxaNWdORC9EZ21l?=
 =?utf-8?B?Y1dWbXZDYTlsLytaSzNBQzJmYkpBSzlFZDc5UWsvL01JL3lUZVRlb1hGTHBp?=
 =?utf-8?B?VWxMN1JYZEUzVnZ2aFgyeGJZRDA1bHd0cXgwNGNPWjNJc1B6bHl0bFIvNkUv?=
 =?utf-8?B?bzRoQUxEUGpxVk84K1VnNnB1Yy9PamxqLzlFVlp4V0ZPWFpzenhlQWJIeFYr?=
 =?utf-8?B?cVR4dkVkeldzWlFwNi9rVi94bUtjemJSdk1DcUdIdkdxcHl2dGtxZDVCZkxX?=
 =?utf-8?B?cWdNRjg4OVMvNjhTazNWRWZFUnBxK2dIZTRJWnNCajN3dm9QL2VlSFFvU3h1?=
 =?utf-8?B?dHhtWkV0Z3NDbFk0eGNkQm5hWDVOcHVsZlJYbzUzRUxxTlEySkNkYkhFbk9t?=
 =?utf-8?B?dEJDaEhhSzVFRGZRd0N4NHJtM3RuS3F1dWhMZXdua3BHZy9YN1pqVS9tQUpX?=
 =?utf-8?B?ei9MYTNad20xdXoySlZmZDhURUpyV1k1Q2VKUnJMeDVOY2kweWFoVE1PeW1Y?=
 =?utf-8?B?UkMwcW9FcGMzSFM1dWkreDYySkx3N040ckNNR09iem5LU0JwbzNpbk9yTzlY?=
 =?utf-8?B?Z3dIdGdDaE0xcE9NM1RQc2ZjU1ZsdER4UkR3aUs0aC96WmJjZW5iTGVUcWhi?=
 =?utf-8?B?Wk1WWU9HZEdnNnl3VnNlYXE4VXZiNnNOZXBhQmNUeVJCTUhrNCtBMi92VXBl?=
 =?utf-8?B?bDIvMVE2SHZtdFNzU3BVVk9yYnJQMlpqRmRQdjAwb0VZUVp1K2lXeldncEdt?=
 =?utf-8?B?Y00xN0ZPUllraEtWWktrc1pTL0hKSGRYcVJEZEYzMjZwNHZBUHNUN21pN3ND?=
 =?utf-8?B?Wnl4dGgvYitUd3Q3VFNnRWh0NThPQmFYVVJPSEZLeklZQXE4ZzZTelhCMkVF?=
 =?utf-8?Q?IOa7QZcr0hbuu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azRYUEhKNkY2UUl6UUt0L05QZlAwSjBobzdhRWIzckhiNjFvelZVL010T3Vl?=
 =?utf-8?B?djAyeEdxVklaQ2RWd1g0eWMzWTBBWGdNWDFST0Z0NnI1SWN2blo0Zmp5QllR?=
 =?utf-8?B?SURIbVNsRWJZWXVmQmpnWnFNaEhnUzEzbGNUbnI2NWV4ZjdkWE45amRILzNL?=
 =?utf-8?B?VUVzcllPY1dUS3A5a2lzLzhxbUtYQ2dac2xFSndMWC9WeHAzMk14OXdlUVdz?=
 =?utf-8?B?Qm9SUkVINFpnUTV5cFZwY3IxTUVHeXdOZVZUdHpnbi9ESUVVTmVrTnpvQ0Ir?=
 =?utf-8?B?a0I2ektDeWNkUDJXazZsV0J1ZTNKT2gwSmx4a28wSW1lSkdRZFhHMG81WHR1?=
 =?utf-8?B?NlI4TlZaUEpsUlUxYnAwa0c3MFRPYWhudmFGSmIxcWJkZnA2ZmErUGdXS3hW?=
 =?utf-8?B?bXB2cWplckFwUjNzd2hKZ1VDc2dxS1oranR1ZngwME41T0lyM3hZTFY0MTYz?=
 =?utf-8?B?dTg5bnNKbHAxWWZHM3IvbmQ2eG95ZlgyaER5QnpOaXladXJqNGJ2WXpSM1Jk?=
 =?utf-8?B?MlNGNUlXcU5COFpHTllKR3Jib2IvbUQvQWhmeXFVeVB1OFIvSktyVlpIMnli?=
 =?utf-8?B?b3JTUTdmelAvMmxWVHp0OGo2UllPTnV0dVhZM2R6N1hvalBRWDhhSW5MTXdj?=
 =?utf-8?B?Y1AxRC9GOEd0VnJZc1lXNzhnMzVKZzlxdnAyZ3FkSTFVQzhXc2dYSUM4VVpL?=
 =?utf-8?B?WjZpbDVKZmo0bDRYeHRxdEN5OHp5RERNMWUvYm8rZEhFVnRqMkxiME5JVUpI?=
 =?utf-8?B?djcvQzIrbmg0Myt3RElJQzJ6dHN5ejBJc0pSTTh1MmVndERsSUQ2TFdUVThK?=
 =?utf-8?B?NVVjek82d0ZrYnk5WEZtZ0FYb2JzR2VLZ2Z6ZDRWOHZ0aW8zN1gwb0VybzZ4?=
 =?utf-8?B?SFVwbHJkb0JIZkhaSUZzVmh1WWxqRFEvQVNMZlRZMGhWSVVDVWVEUkcwenhn?=
 =?utf-8?B?OVVnQitZUEFPT3kzYjI3WnFPeTRWMDMvTWZtUUpwekEvRHRBcjcwMjdIaFJM?=
 =?utf-8?B?Vm1vTjV2RS9NVWE4d0g3V3NYMmczU001d2J2SlMrRmdwWkZrcUlEN2piK0ZT?=
 =?utf-8?B?ZStqUW5Bb3BSQnlBZjJHS1o0QW95enROSGNMV3I3Z0Y0QzhMUFNOdFFFMVk0?=
 =?utf-8?B?ZU41dUU2bVRmaFRwR1VSa1JVZ1VkejZNL0dxVXEwWVlhYzNncEtVd3NzYjQv?=
 =?utf-8?B?RUpGQTJrNC9MdVBkeU8vaHpjQmtOZHpoZmh1dG1meHV4cWZUbU1SWEdocW5o?=
 =?utf-8?B?M290MTRlYVpTOFZST2o5UWp4Z1AxdnRNcTJGUFlMMERzdnFVOS8xak5Md3NV?=
 =?utf-8?B?QnRUS2kzdGxTRFhSbGxueS90WUtaa0JqQVVBbGY3d3d0MkFJZ0dra2NGSHlx?=
 =?utf-8?B?cnFvMzJ5d3lGWGV0eDZqR2JjMXljUlh1WVVPQUh6aVpzTUs4UWJnaXpkb3M2?=
 =?utf-8?B?RXh5czQrZnM2ZGFxS01zUUI3bmdUTUZyaUUyK2VRVmdnRE5DbWNSN1hmdEE2?=
 =?utf-8?B?ZExRSjUyWEZnNlVWTGxZU2RTVFVxRnl3dHZhcGR1R0dLcnZJZ0FGVXB1ZDMy?=
 =?utf-8?B?RkRRT1lqYTBqaEVhNGFOWERraE1JV09lRmJLT1VQN0U4SFd6RzB6enFlVmll?=
 =?utf-8?B?UWNHVEVuVVRxVkhJMTdxWGJ6TWdlZUdnQzA0MFBIVlovRHZ3V3VMemloRVAz?=
 =?utf-8?B?WFBtcVEwTDJlVU8rUE9URWpyZjllTHFUOFlnUVlEVDlwbVdta1JDaU1qV2Fj?=
 =?utf-8?B?cXExNzJVL20rNFJweFpJRUh0c0dML0NCVlBQc1dzOGV3NGYyS2N4UzJJaDBC?=
 =?utf-8?B?Rm9pMWgwVzcwSFNZMDlYVCtkdlA2ZytMVmEyYkp3K2R6TWlURURSNjQrdlAz?=
 =?utf-8?B?VUlxUm42V2tXNjF2RStjbWdtUG4xYUFtLzNWOFl1RlphNHBGRm1XeVplWDd5?=
 =?utf-8?B?MXBONEl2L1BDa1VqeVVXRGFpdFJMTVlocFdqeGNpZUxGclRzbnA5Z0NvRTIr?=
 =?utf-8?B?NHI4Q21VS28wbkN5U01QazUyNDNuQnZUNUdFSU1iMVFUakE0YUpFQ3BjekZW?=
 =?utf-8?B?RWs4TCtPRlpjczhOQmYzY29leFRQVjNZekU4blVLa0U5YTBTcCtvbUhTZE4y?=
 =?utf-8?B?ZHo3MmZsN1JsdjN5MVBpUS8xbGdQcXREazN2c1Y1Y21JNTgzRGNCSUlITWpu?=
 =?utf-8?B?cHc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f360206-16bd-474b-6885-08dd78094f81
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 08:25:54.4282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WX0xkjcg1Bo3q5SZ6grtK6dXmXIAulLsK3TJTHNeGGpCDvbRcH+chV8XkfReR1WONbDEILNBOh0Fitb1uPQgxU/CQxhuSExQK9JHyigIudQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8858

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

In case the RTC is not linked to any battery, the oscillator will
be stopped at startup, triggering a SW reset command for the PCF85063 RTC.
For this setup, introduce 'no-battery' property which can be used to
manually start the oscillator.

Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
index 2f892f8640d1..b342eb13fb2e 100644
--- a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
@@ -36,6 +36,11 @@ properties:
     enum: [7000, 12500]
     default: 7000
 
+  no-battery:
+    description: Used in case the RTC is not linked to any battery so the
+      oscillator is stopped at startup.
+    type: boolean
+
   clock:
     $ref: /schemas/clock/fixed-clock.yaml
     description:
-- 
2.45.2



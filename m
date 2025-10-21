Return-Path: <linux-rtc+bounces-5110-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E194BBF4B7E
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Oct 2025 08:38:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 82BED4FBF08
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Oct 2025 06:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C402609FC;
	Tue, 21 Oct 2025 06:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IWtWKxce"
X-Original-To: linux-rtc@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012062.outbound.protection.outlook.com [40.93.195.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5E71A3029;
	Tue, 21 Oct 2025 06:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761028632; cv=fail; b=XTBEzkbLIlOChHWvV94QPiiGe167V9MF/eqebHxX1AYAQGtNuz7joAvjqpl1mUei9wNRF9+dgwwTayER7GLQT5HUKUBYtjFN8j/llDEdvOut9TxFLv3MnVbEJX1BGYy2H9DDBjB/Auswnd1k+PAUfN4LfOUKwQTK5CRSJzj9Yp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761028632; c=relaxed/simple;
	bh=fRGTq7MWxV9piCTykghwtrUjUMfenR/dUNRdUC4R4VY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aH5AH6kdG60NorNIoc9P+ULE2JBiHEhkUL8r4rPsB4ON3thaBT6P0w3baBszyKFBp+FdJK0fS+TbqM1//hFEDX3XS3aEPwWrSw85YFZbYaYI23n7XmOhb+Gz48jx0rebG1JVYAssIt5/hMgg6moxkIALls72ZeazOJmww46nBBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IWtWKxce; arc=fail smtp.client-ip=40.93.195.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ujhal8lOuaEOYjqc9jJgFDYyKQgFCyAG50qCl44BPL34qC9OfMsWhOlxfh4LNHLkbDHpkb4MrNVrBCwa+D/jpBhpE0voKZ4XiiA82wxsajwmPiJFGlxI6LBGfK6YOCdxUhSeRXTbE7pIWoNH2mr1Ho9HXDaCSTcHsi/nJhbI38J/5OO/HWx50cs1Ytxqn6kjWN5NhaWWuP3J4hhbGY2x7pr+nFSbPAot9/0+MflldSbuLRpbD60uI0vdHweNoy8O68vx6ZZA722tWlUcOWLttsepygafGihIrWSTmBqumWrrA6tBenNd6GUR0NwDTk4yM8CIe0RHsDIhW0oYLOMv/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EnXsqvRR3A04r0mj7NLYpGfRiqATw2B8aMjqs2jklKU=;
 b=DoDY5bnmV5m2D0tmhPNnLXMhh9EsgI/f4PHto0EM5lPeFq1EcmcTzIINl1T2nmnZCxP5QKJIUu+Bi8IrUR9RlD+FirhDJFNGm5sTQn7BEEFm858/ABrQ7Pcgr2bnwspxQ+dhQhd2mnxgB8muVN7A+HZ5jcngaKvf9UJV4mKv3y7kjZ2kJVU1TnHJrSNp6xGu6lmux5+/Slonx684RFR52V7oU3xZ6UgBld0w7p8jVZi4K6R3J9n6Fc3j7WDEOBDKR5phl6pzQT8RXSYyny7At+uT1uxcF/5l8V/Y8/ol8amEfeprslg0lSmTySFiF6d3ta20fZZf5lQSbUb9UuqZJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnXsqvRR3A04r0mj7NLYpGfRiqATw2B8aMjqs2jklKU=;
 b=IWtWKxceMlgc4HFluKvHDNEA5+m3lW8CrwrzoBUbuTrZR+umSsB+qTX1b05NKGG9rIdsp4Q5UMoeq16ggyFl7J2Lq9uAtrFDbdRHR2Dl4vhIzK/YP7itzYJVScrf1tBx7RjNoReG5hXKDLtbRFYTdZX31AkKM4eNQW61SKeFegQsk17TmGT3FP0QCxHz4mizRXN6U2RxXqXQLQlPV0wT87phb9EXOgi0jZyP7PsOGb52IyNmNH6V1Lxc4BciIMtsh5K4mqph9N3IppbzJOxFiqU0a7vPdX+HML9fBf9aFhjqCdlyxHFS68lm5cdBU6ztIFpmlyei3B4UiZ12O40LuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by PH8PR12MB7328.namprd12.prod.outlook.com (2603:10b6:510:214::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.15; Tue, 21 Oct
 2025 06:37:06 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861%3]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 06:37:06 +0000
Message-ID: <e03ab196-c204-4e2f-b69e-400b464e3d21@nvidia.com>
Date: Tue, 21 Oct 2025 12:06:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: tegra: Add ACPI support
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: alexandre.belloni@bootlin.com, thierry.reding@gmail.com,
 jonathanh@nvidia.com, linux-rtc@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250919111232.605405-1-kkartik@nvidia.com>
 <aO9Vmfm6jPplEQca@smile.fi.intel.com>
Content-Language: en-US
From: Kartik Rajput <kkartik@nvidia.com>
In-Reply-To: <aO9Vmfm6jPplEQca@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0200.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::15) To MN0PR12MB5716.namprd12.prod.outlook.com
 (2603:10b6:208:373::14)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5716:EE_|PH8PR12MB7328:EE_
X-MS-Office365-Filtering-Correlation-Id: b1ed2cd0-32d3-441b-fbe2-08de106c4098
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWY1ZG84NUEzbnY0RUZYWW1NZVlibzhBL2RoVXB6OHMyQVpRQlF1YUplRkQy?=
 =?utf-8?B?ZytydzdtNTlQTVVqcEY3cDFNOWZuMHFwMnFNNTQ2VUZ1d1B4RGpBaHRVNWIv?=
 =?utf-8?B?SXhEdFkrSVhvcm9HNkdzTWFsTVNncUFWaGZaSTFabnI5dGJlNFd2ckd5Ym9P?=
 =?utf-8?B?TlF0Um5uWkdsUkhhcVFvUTAwcERKaitUdnJBU0NSVzJ1SnZHeHpUc3V4R1Vv?=
 =?utf-8?B?Qmc4T3RvU0N6YnhwUzdoN3JGU0ZhdEtIVkNoZHVyMHl1OUFBVU5JalpPZ3Fh?=
 =?utf-8?B?VXRkMkc3dFhMNEpRZEFDVFpsMVRjdmkyK3d0TWFweWdRZ3VCNjdtMmgrQ2RZ?=
 =?utf-8?B?VTF5ZHNTTTdjbUZQUVVQa0NnSGtsR2gvUXlFWjJsT29iMTdoTTVReU50RWEv?=
 =?utf-8?B?SXorbjJIZXNZM2ExdU0zT3VZVGwrYlJ6R2FjNUZ5aThPRXZDV0htSzdDQnZT?=
 =?utf-8?B?OEU4MzRYTHJEdzZZNzJudzZXM1plcW8wV0NKTmx3WXFzSW9KN1c1RC9vUCtE?=
 =?utf-8?B?SWh4S0xyeWV0VytqVlhtQlBiKzBYbWxVL3c0QW1qaXVNTDlNMUMzY0FBWnVq?=
 =?utf-8?B?Q1B5eWF1V1lrQ04rWUQySDNrZGN5ZWhCOGhKVVZ3dVlLOW1SNmhMZHFsTFFo?=
 =?utf-8?B?SWtLa1BxcUVrYWMrTmpkbTdFeW1vSWtOcWFJNHNZWDRXMVFTbVRvR0kxLzg3?=
 =?utf-8?B?ejA4KzI4VlFyT1VrMEdCQm1Ebys0NG4zZzRPYWJHRnZ3UldTbEdtWUN3b3VG?=
 =?utf-8?B?Zngxd1prQlpYbXFHZGhrdWtIUldiWUlNZFlmc1c3OXZXR2o3TlZqYzFRNFZj?=
 =?utf-8?B?T2xIR0RSM3NiSHFCckROSjdrOUxTaU9aN095UzU1NWM3SlVHR1ZqZ3lJWktU?=
 =?utf-8?B?ZlpoSURTUS9WdW52dEgwbDBWSndMaUhnMjFFRjVLczBYUWlwTnREWGNuNVVJ?=
 =?utf-8?B?YWNFZmViRENvOVFQT0JjaTdta0JwUlVWbVIyVG1GT3RsdTZlZVhwQmVRcjZZ?=
 =?utf-8?B?KzlYYXE1dit2VkF2L2RGZU5ZRGZ2eWlXUWxCOUh4U0w2Nk5FUlEvTHpSOVhR?=
 =?utf-8?B?YzA1QVlCVHBBZERYdUVwbXJtakFaZFRJK2Nuc1dLU1FpVHNTNnR5aGxCOXZ6?=
 =?utf-8?B?Z29ockdPYnFqbElRZ1kvZVZnVHFoc0hNbEJlTTFXVXEyZU10S0MvZXo0amVJ?=
 =?utf-8?B?U0liWThFWVd1R1QzL09sRUxzVS9FVHhNUFZvT1pqMENhaCtUK0ZiUjI5S0Jv?=
 =?utf-8?B?L09FMzBmMzdaQzBWMXJ1d0VEUWd5bXc4K2VqVGNCeXRUelJ6NGlJQ3dkOHdy?=
 =?utf-8?B?NXNsMHI4V3l2RnlzVHE5Ty9MTmU1UlhkSmRpWUk5Q3lTcENTVjkyZ2lGa1RZ?=
 =?utf-8?B?M3VqbnNpbVZOOEw5MHhESzVqdkxuU0wyckZwTldYVkczdTArZWgxU0EvN1U4?=
 =?utf-8?B?Q0ZBd1dFU3lpMzlQRm96d2toSWtXeXZRa1h0Vzd5NFh5WVdpMXNRZ0JERlF2?=
 =?utf-8?B?QzFNczFZblZTVWthd216aVdIK2V5emFuSFVSNEdYS1lzMlpUN2EwSDRLQkFh?=
 =?utf-8?B?TlQ5T2xqU2RRWVkrYm1hZDR6ZHd6NXJSQ1Iyd3hHbGYzUHVOZS9XTkRPbzZs?=
 =?utf-8?B?NWhwRXhuWXVzTy9ZMkM1R1ExdHBhWm5lcDEvSUNZZjNMQ0RXRnNIVmZLZFgy?=
 =?utf-8?B?ZFJPNDgxQWUzUFZCWVQwclBlOFlYR1ZzV2Yzby9rVzFoMkJOU2tkMlp4WUZk?=
 =?utf-8?B?aGlUKzl1bE9tazFSUEQzYUdsTFMwNlJmUFZDUTJpYnk4eFhLbXpkbWJyS3Nu?=
 =?utf-8?B?U0hZRlV6T0pXRjk4RlVNYUw5bEdEWFhGd3J3NnFaODhlNEJWY1BVb3hjTFBT?=
 =?utf-8?B?U0EyT3I2TDF3SzNJQ1VVN0V6QlE0dWo3a1FwNWNwbmEyZFZKWHFxc1pxY1R0?=
 =?utf-8?Q?3wlNHcCo6epvBeRGPhzSGcPKLqPi3s+k?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGRHL3F1TmhHYXFwS2Nlc1VUakNOREtHZnVtQXd3R3ByMktmUUdEdU8zUkgw?=
 =?utf-8?B?Y090YXZXZUdpSkVQa1NiQWlmaEdKakNiWnpGVkN6OFBhNmpkb3lrMW9DdUJ6?=
 =?utf-8?B?MExOcFJmZVBzY2FNWUdCa2FNU25NSzRhQ1NoVWFMWUxKYlRSZElEOXFzYnd4?=
 =?utf-8?B?dEV4YURCYTFFL1ZWYjdwN1lNakFoMnZxWlBBaDFIWnN0Q0lVeEtoTHBNTFhr?=
 =?utf-8?B?V0liNVV4Yk1zTnN5Z0tZdTRnSE1YS3BjVUhjWUNRU0RabGZGRFc4cG9YNUtm?=
 =?utf-8?B?Ukk3cG52RVpQdVFKZXRGcmRKTVNvdXZ0elpoMUdHcmUwcGVrQWJtaEJwS1pJ?=
 =?utf-8?B?bVl4akxUY29Pby8vVFFaT1JFdCtOOXdyODR4Q2hubFhudys1YmlBVVNmTmc4?=
 =?utf-8?B?ekY1UlFBcUZ2NmNqQ2d3RjBkS1RnN0FYYWFITDBWYXBiWEFOQm1uQTU2M2FM?=
 =?utf-8?B?b1VqVEFZaHhYN0s0YlRWL2RSYWJEVlRhYTVEUHE2TVdlZnR5dU5xNFE4VzBr?=
 =?utf-8?B?YmdVQWk5SmM1TytXNjNwRUxtVzdVRkphS3NvcE5wN09GdXhCV2ViL3RYa3lL?=
 =?utf-8?B?dDEvZ1RVeC9hSWV6clkyeDlZWFJ4VVBtZk9raWtZQ3Blckk3bklHNWxadmdW?=
 =?utf-8?B?aEFReDQ4TDY1U0k4NkY4Q1pJcDk4d1NjUEhLdStpZFU0UzVUZGtaNjNQclZW?=
 =?utf-8?B?UDJwbGFadFRQUkVMa1p5bmtkSkQ2ZHFHUk5Ja1JnR0hkcGtjbjQ5RG9Qci9p?=
 =?utf-8?B?cm5WWHZEZXQvblZVTjFnL3JBVTVEVXJtUFBjdWxoTlRpbDcvUEZGSE5pdGtK?=
 =?utf-8?B?d3NHWGVpNmJ0cFV0ckZiTGZMVmdJK0k2dnlrbWJsWmZHWUVoZ3dyT2FFaFYv?=
 =?utf-8?B?eG5sYm9Xazlpb3FqV295aERhd29ZL0dpM0VmWGVlUm9xTnozbG9xbS9CNHFC?=
 =?utf-8?B?WHlxRzdUV2g2aU9RcG1POElzN3FrUCs5c3VvKzl2a01yZEZpaTNCNWJMdDU5?=
 =?utf-8?B?K1VZWDdrSHNBbjBXcmljZE9OT25WclQ0MW1aVVBza3UrVkpmMEMvT3FUeStC?=
 =?utf-8?B?S1dHWWlidU5uZlFka2t4dFhucDI2bjFKWktEZ2p4UmdSYWxKOUZnVEM4S1k4?=
 =?utf-8?B?VTd6YXR4MzhLRlF1YWMrNUJGMGx1YTRnSEY0bFRQVGZQMVhBRWVXK0xSUDE0?=
 =?utf-8?B?bVdzRFBIS3VxM2tabVp3aFhWMWliTWcyMnJsZ09nTlphRmVkTGJucGIxalhM?=
 =?utf-8?B?RVZNZmpTN1VpdCtkN0lBalpWTVl4TlJyM1IyajNjMmZRUENCd1ZZZW9hOVFP?=
 =?utf-8?B?MDhlMXZZS2plalZxck82MEg1NHJPMXRPWHl1T1JhV2FOTWZRSmJieU9UV3pz?=
 =?utf-8?B?dkZQYXE2NXNwWEJ1QWIyOEZlcmh2YkdvNStxOFpLWU0xeHo0RnFrNG1pQ2NW?=
 =?utf-8?B?RVc0SjhXK1lqWnZURFR5ZWNuNmUvTXNMUnhhdytXRGJVeUYxNjF2NCtSMkdv?=
 =?utf-8?B?akhMbDBjblJWT1VTUUUza0JITkVsQUNLVVBqZEdvUVdtZWJtZG4wZGVBeGpQ?=
 =?utf-8?B?bWtNOXBNeUNhMUhWZWJWb2FHZlZDeUFucS9oR1JBQ3NoVjRaWnA5WnFJd1Iw?=
 =?utf-8?B?UW4zK2J0RjVEWDFMZ1pjQWJiK2Q0Vm1Nd1gzTWNjTVNMUVI1MnRSL2lZTnVm?=
 =?utf-8?B?OVp6V3V0TEU4Rmw0bVJaZFU2UDIwRnBTUVI2R1cyVm5ReFpUb1JZMHphamFs?=
 =?utf-8?B?TDFYTThFeXFZZlVBMi8xUjBSWFZFZnArdkd4UEo5OUZIT3hLZWdBcEg1RUNm?=
 =?utf-8?B?TzhCTDlxQjNTMmtiOFMvUmJrQUdvcEowdU56TUQvWHVZQVpwblNwbldJS2JR?=
 =?utf-8?B?emM1VXh4S3JHaWZCUGNCSlhDblRVVUwxOEZhcHd5REZybHhIWVBINDZ5Uldj?=
 =?utf-8?B?UWwyOTZnUjlpNTJtV0xIK2hnY3piVEYwMGhJbDgwd2Z4cjlISTQ3NmVNU0di?=
 =?utf-8?B?N2NHbjY3N1JPYXhpcERGTXQrNmRXeUVlTVVibmVyenBhWjlEM1RrT1g3QWU3?=
 =?utf-8?B?VHNVU0oyNXVPampuMjBjbDRWUTN4aTVmeG1PVTg5SWlFZ1JCc1hSbUxTYWQw?=
 =?utf-8?Q?4uQkqjEpWBbqgy10411mkpHlq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1ed2cd0-32d3-441b-fbe2-08de106c4098
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 06:37:06.4301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CpnfbsKqZqlFJkKNuksMiX19XQ36ImpLFAz1IVvzbVacEi7AmW0MuSLIsj6HJxogNfOxE17dT0+fLiohiS8qBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7328

Hi Andy,

Thanks for reviewing the patch!

On 15/10/25 13:34, Andy Shevchenko wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Fri, Sep 19, 2025 at 04:42:32PM +0530, Kartik Rajput wrote:
>> Add ACPI support for Tegra RTC, which is available on Tegra241 and
>> Tegra410. Both Tegra241 and Tegra410 use the same ACPI ID 'NVDA0280'.
>> The RTC clock is configured by UEFI before the kernel boots.
> 
> ...
> 
>> +#include <linux/acpi.h>
> 
> No use.
> 

Ack.

> ...
> 
>> +static const struct acpi_device_id tegra_rtc_acpi_match[] = {
>> +     { "NVDA0280", 0 },
> 
> Drop redundant ', 0' part.
> 

Ack.

>> +     { }
>> +};
> 
> ...
> 
>> +     if (is_of_node(dev_fwnode(&pdev->dev))) {
> 
> Simple dev_of_node() will work here
> 

Ack.

>> +             info->clk = devm_clk_get(&pdev->dev, NULL);
>> +             if (IS_ERR(info->clk))
>> +                     return PTR_ERR(info->clk);
>>
>> +             ret = clk_prepare_enable(info->clk);
>> +             if (ret < 0)
>> +                     return ret;
>> +     }
> 
> ...
> 
>>   disable_clk:
>> -     clk_disable_unprepare(info->clk);
>> +     if (is_of_node(dev_fwnode(&pdev->dev)))
>> +             clk_disable_unprepare(info->clk);
> 
> Redundant change. CLK APIs are NULL aware.
> 

Ack. I will drop this check.

> ...
> 
>> -     clk_disable_unprepare(info->clk);
>> +     if (is_of_node(dev_fwnode(&pdev->dev)))
>> +             clk_disable_unprepare(info->clk);
> 
> Ditto.
> 

Ack.

> --
> With Best Regards,
> Andy Shevchenko
> 
> 

Thanks,
Kartik



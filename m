Return-Path: <linux-rtc+bounces-2671-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF88C9E6794
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Dec 2024 08:10:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D0F316A6D2
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Dec 2024 07:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A29E1D63D7;
	Fri,  6 Dec 2024 07:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pR8VqjNO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2065.outbound.protection.outlook.com [40.107.22.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB51C18FC75;
	Fri,  6 Dec 2024 07:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733469007; cv=fail; b=KnSZTmrv0LNzOQ22Llf5ssgeiCFDDoIoYKJ6UE4HCLBZKa9y4LvRXtgU9XKSa/b9JiOUOS17boRY7K/0kESaHY7qzOnJrU4cB4MCtBV7f7NGsszGy05xvAEWQthc3HYClsFfsO1uA3w1ruRR3BTYY6tUNviZ607/VSg2ARgpbDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733469007; c=relaxed/simple;
	bh=OwVOoYcHW0MAz++TaDaZosK0qJ1n3ye+cWyRJhZ028g=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kOuLE0hXhvnR4s3HGuIVgnQ8IKqFubAzc+adGNDRpYT2du86m1qNsYLduGN5VAw8wh1gVHXqiBscEaT8Y8nGjmpu55z022Vr5Dehou0Pisz/vlvHwnaj/GZZvEEX+xkKwZJwH791Q7efxnUdflkNTE48/RdO2echTR+pQIXavLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pR8VqjNO; arc=fail smtp.client-ip=40.107.22.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eyx0Jcu8p5LQ8yXPUjxvuQzoGcOx/labLbiZAxx7zUCWjjUe/j7Fn1YKsvcXAbXUrC8Vm10nwtg3r4FD6+XE1NISYfyjpZ7Hfz2yqx8uEODu3rV+SqXm9k4+IHZZOOaPQWHEns/JGih7dsGguYPm1b2tuk5R06losBq3dd1hlrNdxgbBxOMFMaiIgMsGlmrT2HSHUquZLF9Fbp+j9OZp2WJ8DdwOYIiAw6h0T9/jU0SxQyUc8n5eHb1r32C3i9oo5r+6jE7Dd4tTaRIBjxuhtwuh4ZD62pARrCUgoTerDNawm17yZUpqgjKCMz2M3fylf7qUw3WPogMZbkxst9qIAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzgCNglm6eAON2T84Qo6ziGsIt6w0AyzOvXdt+K3ygc=;
 b=jnFzxrHySPof002o7+AQWXQX7Z3PxFs92qnorUF55YvnDOnjrbFAQouk8fyOcMEeNHXw+iMDLRPtNeLpGVYox5mRAuRodfnpRkES6at9X4x4KdTjwtkUVvrOj05bGoAOfnu8fpjn7SSU+jF7/EzhwY/CcjlMy8h++KCt1DoXOaCAsn+I3ALHqR5WAyPHIVrX+Q9AnZJyhhxBn7BZDOI6vHtVPH/Z6Vc1VjsZST8BaUPtpZ0icCfD/Y1Vt69MIErkiVfM30JVXMuf8GGAhUdaXZYtzz5WqmVz1/aBt0LBnq+Bv3S89iXOOagThSrt+xqgTpK3OOrMusHTj6Cj781u4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzgCNglm6eAON2T84Qo6ziGsIt6w0AyzOvXdt+K3ygc=;
 b=pR8VqjNOjN5oZhjhYcR3xaL/iYM+tHvvWvHXvnIMebDhsBqvvBtw3z0ZC6iawmIeo1W57BtIIK0bbp9sTQvuBUDIj3c4EBUQHKAEpIbSUCnCN5KpDtK5hrfrBbGfNDT+7P3OX+iVxXKZX4ZL96gmgmW/ja2uHaUHehR+LIXeI8pjHS4dZymsXl58hcQO5jn+lNktVwGE7djpkjurhhFOz2ZiffyG8vHACuDJ3EZiQJghGqy8yN+EhyaempnfaYeWbU0Nq2FxLLF3jxIZX6hJXazJkuHYJLqmMbZwULtcS9ET9N1Fc3Y9Tv3MMSk92ywSaO2VhUopLkZoBWgzwzT9Vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DB9PR04MB9889.eurprd04.prod.outlook.com (2603:10a6:10:4ef::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.10; Fri, 6 Dec
 2024 07:09:59 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8207.017; Fri, 6 Dec 2024
 07:09:59 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux <s32@nxp.com>,
	imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v6 0/4] add NXP RTC driver support for S32G2/S32G3 SoCs
Date: Fri,  6 Dec 2024 09:09:51 +0200
Message-ID: <20241206070955.1503412-1-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR06CA0079.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::20) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DB9PR04MB9889:EE_
X-MS-Office365-Filtering-Correlation-Id: bf4dacf1-1e2d-4f5f-6528-08dd15c4feca
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGhhOW5QNWVBVTdJYkdOclZJamNoelNoaHQwMmtKZG84S3l2a1R2bE1DRzNp?=
 =?utf-8?B?YU53ZnVUNmNyVHpSVzBOTjJ2ZVdoa2FjRDc1ZjU4bFNCNFZlVmdQQm1GVUdx?=
 =?utf-8?B?eVNETldPWktmbWVxT3FHWUpRTmFyQVZhQkdKK1R4M1o3WnIwMTh2eHpPcHN3?=
 =?utf-8?B?dTdYeVR4VnQrY0VudlhaV1hhb0JKampIUkVWek4rQlpydmFpQ0hITm5wQlFV?=
 =?utf-8?B?a0JmN2lVVzFULzhNaGJSWnVOUDdtSlFYSFFDWkFRZEh2dkdnelorN0U5MTNw?=
 =?utf-8?B?NVlDTzZwczE0SGVpSVYySkVVandldy9iaGJlbUFCd0VUaW83QzFTVkRrMlBQ?=
 =?utf-8?B?VVYyYkoyQW5OakJBUjkzQjlJVUlrWWhOWFBvVzF6ZE1MK0gvUEg2c2hKc205?=
 =?utf-8?B?d2pPUnR4S2JzY2xOc3NzeWxyMENGSmYwWndVWUlybXhsV1ZWdmVOM2hLcVZP?=
 =?utf-8?B?R09FQjRIUUxUaENBWmN1emkxZFBhK1lRNnhiQXpCRzFKbGZyQUNZWlNSYkRi?=
 =?utf-8?B?eHZzaVNjM2ttbExkWEtOSmhYOFBhSFoyZDVOVlpsRUZyejh6Wkl0cStaU054?=
 =?utf-8?B?MWllSmxzMGtTZ210cFN6cWQ1c1B6VGh4U1V4dVY2c1Q4THgxdC9TUVNJcXV4?=
 =?utf-8?B?amNGVGN3NmhKN0FXeWgwSERpdklZMHRzUWtsRTBZUTluanBxUGQwTW9jemRk?=
 =?utf-8?B?d0hEUkZSa1ZtZXhxQTRXU2s3bVFrVE5IOXVlaVptRDVLSmJkNE5CVWlkczN5?=
 =?utf-8?B?Zy9wU0dRT2RuNy9KUHI4ZG1xMFR4TWtnTW9wZlIzclBQcVU5WDVBRXBMcHlB?=
 =?utf-8?B?bG1SZmhxaWRHMVdxNDZHckRUNUtBckUwT1pKNmFvTk9ndTFmenJEbzNaTENJ?=
 =?utf-8?B?aHQ2cUlwQm1WTUUyMEFxazlzTFJVaTUrSkJWRVUra0RmMjBxS2FYTkI1aUVy?=
 =?utf-8?B?b3lqUExyS3MyTU1mV1N3YU1yS3ZUajVzaCtZNzh6dUJERHg5c2U3RWk2VmRK?=
 =?utf-8?B?SHBwNHFDQjFxTE9qZGREaXczRC85eU5HMDM5YkhCaWJ6RCtaNUFtcVprczh0?=
 =?utf-8?B?ekROalNmS0pwRElSa3c1Zk93bkszTkI2RjB4ZmtsUFAzQ1QzeWtmSEpLa3di?=
 =?utf-8?B?RVlGQ2NPVGRtVGR5TldVQXQ5TFhRRWhTV3Q0VG44dGc3Y2puUkYzWnZwaE9k?=
 =?utf-8?B?ZHNJNjdPdkNUaE12eXJlcHEza000MUxPV3ZWOUdsa0xYUGduZWloYU5qOXdv?=
 =?utf-8?B?bVBQNXdKU0ZtSlRnQnRlTDdkZVhuKzIyc05aTVRQS2JUdGxMTFpWZVhnQ05Z?=
 =?utf-8?B?cVFuSU9XekFYazVZVTF5dEFrdTlqM3NKbDcyMmJ6aWtMTlNKU3ByRTIxbEN0?=
 =?utf-8?B?K25kRkJ4RjNxZmFuQW90c2hYcDYxazNwUXBTZnN2ekhzdy9ZZ05XU21FaTB0?=
 =?utf-8?B?RzVZZzcxYUxqbWJYUXhoRGVkQjV4YnZmeUhIcXVCMjM1ZVZrNzNjNFFiaWhk?=
 =?utf-8?B?SEtDNzhPYlZUSTMxcUEvWnJkMjNPT3NZK1Y5L3V4ejVkZG5Ic3R6aXdQQXB4?=
 =?utf-8?B?NVh5QU5zWXp4YWsycy9IdzJkNlRub2NkenFaUGt6VVFDTTcyWkcxZmUwZ2RE?=
 =?utf-8?B?ZEVUbDB1eVFuOGFaVGdCYVNKZnZBeDNLR3p6UExCS1k1ZVo3NG50MVBjZjFM?=
 =?utf-8?B?VlA5eE9PdTVqSmx5RDBza0NWdWpDdmNiRUtHTGo5SnpFUEJhLzJ4Tks3dUJJ?=
 =?utf-8?B?VlZTdVVyMlBJL1IzSHcvdkF3QjRNa0dTc0trUjk1RC9vMVFxRHVrd1ZxMUVH?=
 =?utf-8?B?Z3ppS2hnU2FWblhDSzR1dz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmV6WGg4ME5uL29PN3A0YzUrSWdoQ0NEYnlydnhIYjZESlcraktVYW13Uk9x?=
 =?utf-8?B?V0pWYk1YVW5RUUZsYkhuVnB5a05HZWlKTDFUZkVFaHQ0d29zUFdqYjhvOUk0?=
 =?utf-8?B?cW9ONm5LeFhMZWZZY2N6bHR4Q0liZG9PUGs4SXdIM3dJN1BmdjVOS3RVWjdW?=
 =?utf-8?B?Nnk5a2JpaU43Wm5TVFdFb0R3NHJoalFxOVdUZ2xSbUc5allhS1JveFlJQmls?=
 =?utf-8?B?SXEvOGJkcThHS3dZUEhlYjJRRUVUUElDd0dBa3l2RWVnREJUSmdtYXFVdmRo?=
 =?utf-8?B?emZvWW5ZMzlPRVRMdjlYSzlxWmRNMG1wc0JKRHFNemJFNEJ4VHFXd1k3WXNO?=
 =?utf-8?B?YnBmTjRMQmozYitYNXhkQ1J1SGhmTlRkWkpYcktkSnNYWmVLLzluUGZ4WmZ0?=
 =?utf-8?B?bFJMRm01V251ZmdMTmFBSEJmaE8xdElUQnNrNkxVY0oxVjJKcGpSTjdXSGR6?=
 =?utf-8?B?QWdUMURwQzBmY3htdW96ZGZ5NW5EcWo1WmdQczNFcGE2ZmJvR3AwZWNJYnNt?=
 =?utf-8?B?WjFmSmw2L2dVYUV2anQwRVhzUWt5RFF0WDFmb0hVN1Zad2tCQUJ0TzNRRHM2?=
 =?utf-8?B?RWxEYU41d1ZkRGF5ZXZBQmoyQTJuejIxckorZ29iK0dMaW9YeXYxbnlDRlVN?=
 =?utf-8?B?ZzZUNWlWT1J4SmZ6aVIwVm5FcUIrSE1ZcUxPYlF4YzQrM0JaZjN4M1d2QlJm?=
 =?utf-8?B?KzRXWUZaUVlReldyV2lRNlQ2SXZUZlZGQysyYUwrN0xsQ2l6d3diRkNYbC9r?=
 =?utf-8?B?Vit5T1djMFlkVTBucGViaDlFbzVXd2wwejhYajlhWHQ3VTNQNVFQTjI4Nml2?=
 =?utf-8?B?Ylh3NWdhaG9IOTQ1N2I3eHpBcVFLaVlyM0JHa2VlU01xUSs3Ly9FMTgwSWxT?=
 =?utf-8?B?TVlZYVBnSjVROVNHYjV0Y3BHb0hGR2VMbjl6YUhZSzdhelRyZHI4MytlL3J3?=
 =?utf-8?B?ZEg3c1FUbGtSazBtNTN4bVZGYVJBeVZrZ051NFFvaWttbGhKbGhCc25vQ2Rw?=
 =?utf-8?B?WSs0cXZCMW5JRVdXQVhkTDFVN2lzUFAxellUbDdOVTl3dm90eHYrU3RyUEYv?=
 =?utf-8?B?Qzl0MUJ4SVljSGNlckJpVUlYUE8vM1VLV3E4N2ozbkxKV0xqUzZCSittOXFS?=
 =?utf-8?B?bTEwZndjcnVZZ252dHl3eGxYZTZvWm5CSWdvaG5ZNDd4NVhjZURtZkZRTUkv?=
 =?utf-8?B?Qlc4bFBJUlVFTHJjeDBteHpnamc3ZlB1bHJteDFhRngvSnMzWnF3Q2E4czNC?=
 =?utf-8?B?Y21qMys3M09hRDdvbEVhZ0hZbmhqUHNKd3o4UWRRdG1QZmhJZ3NDTExJYTB4?=
 =?utf-8?B?b0hzL3IzblFoOUNaeXlLTmR3S0wvWTZ0SmFQRnpqY3hmbzNwbHVwT2JZR0tR?=
 =?utf-8?B?TG1yaEZrazN1VTFUejhmR3hoVmJhYUxWUjVycHE4S0dFVEt3VlhBc08zN3l5?=
 =?utf-8?B?R2w4Z3FZSkFZbWYvWkE0cEpFMnV5YmtiTmRKMWFCMG85eTRXbTByMDdVUUJs?=
 =?utf-8?B?czNpWUlUbklHTlVyMFhLQkRBRjFFSGhBR0NCNjR3TWdTTktEdVlGd0h0MTZ2?=
 =?utf-8?B?VUJIQmNSNndwN1pNRUZFYXdrZGY3M3M0WjJtekp3VDN6Zy9qTzd6VGlOclBk?=
 =?utf-8?B?NkFHd3A4Q2lEZXhEZXFxNHZuYkJIR3BoalVTcnh2ZUlVQlhQeFRIRDVlbGVk?=
 =?utf-8?B?ZVZlVEhaTDNJN01rWUg5azRNVDE1SkxvUThSaDBPYVdMb0YrYXJqcTBGTmFy?=
 =?utf-8?B?cGJxT1JRK1BJcmlFTTF6L0dDMThrR3ZkUDJCUTEvUW1USzE4VlhBS3VLUFFH?=
 =?utf-8?B?L3ZiWHNSZThPdFN6VXlWU2hiMkJlQ3RYWHJtUXMyYlJveGNiVnByTWEybith?=
 =?utf-8?B?UjhZSWVTdENOaXNkUmxYbGFncDFpdkNZakh0c1JpMGtMVXpvRFQ2TUZrclQv?=
 =?utf-8?B?MmxTUGdHbTlLbnhXL1hiNE5KY3M4bnRBYnhuUkJkNnlZMjllVnN1aXlLU25L?=
 =?utf-8?B?UFBTSFdsWEN4b0N5M0d0NFNmRy9aaVppUitqUkxnbE5UbUZBQXhFelFoM1oy?=
 =?utf-8?B?YURUZG9RL1dacENYdVkvTWM1QnU3N1dQdk1BWitZc3ZEMjlMUEFyV3A5Nk94?=
 =?utf-8?B?WUtNeUY0cjZlc0pOMlBzMWNKbU91Tzd3c25YT040cVZ4Y0t2blByQnFPODlF?=
 =?utf-8?B?S1E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf4dacf1-1e2d-4f5f-6528-08dd15c4feca
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 07:09:59.1273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tBPUL31gU7iBm1kKLHcaINLj5tK2GOPNAaAkTzpuF1BodcBmCvj8rBWTTMRK8jquVCvN6KLeoAqqWUagusK3/8YFrHygY+MFvXhkiFdhMSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9889

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

This patch series add support for the NXP RTC hardware module present on
S32G2/S32G3 SoCs.

RTC tracks clock time during system suspend. It is used as a time-based
wakeup source for the S32G2/S32G3 SoCs.

RTC is not battery-powered and it is not kept alive during system reset.

Following is an example of Suspend to RAM trigger on S32G2/S32G3 SoCs,
using userspace tools such as rtcwake:
# rtcwake -s 2 -m mem
# rtcwake: assuming RTC uses UTC ...
# rtcwake: wakeup from "mem" using /dev/rtc0 at Wed Feb  6 06:28:36 2036
#

Changes in V6:
- Fixed a coding style issue regarding kernel doc reported by kernel test robot
- Refactored small sections from the S32G RTC driver without impacting
  functionality
- Fixed an error probe path issue on S32G RTC driver.
- Added 'rtc' schema in S32G-RTC bindings

Changes in V5:
- Removed rollover support.
- Removed clock switching support between Runtime and Suspend. A clock source
  which is always available has been used instead.
- Enabled 512 value RTC hardware frequency divisor to achieve higher rollover
  time
- Removed unneeded 'remove' callback.
- Decreased driver print verbosity on error paths.
- Provided 'clock-names' actual names in bindings documentation
- Remove __maybe_unused notations. Used the DEFINE_SIMPLE_DEV_PM_OPS() and
  pm_sleep_ptr() macros to handle the .suspend/.resume callbacks.
- Fixed some alignment issues.

Changes in V4:
- Dropped 'assigned-*' clock management approach. Simplified RTC Runtime
  and Suspend/Standby clock configuration.
- Simplified error paths on probe function
- Removed node label from bindings example
- Several cosmetic coding style fixes

Changes in V3:
- Removed 'nxp,s32g3-rtc' compatible string
- Change to 'remove' callback from 'remove_new'
- Used 'dev.parent' from 'struct rtc_device' instead of defining a
  specific 'struct device' in driver data
- Fixed several errors reported by kernel test robot
- Removed 'assigned-clocks', 'assigned-clock-parents' and
  'assigned-clock-rates' from required properties in the binding
  documentation.
- Refactored S32G RTC driver such that a default clock source and
  divisors configuration will be applied in case 'assigned-clocks' and
  'assigned-clock-parents' properties are missing.

Changes in V2:
- Removed 'clksel' support from dts bindings. Used clock parents support
  from CCF to better illustrate the RTC hardware IP from S32G2/S32G3.
- Removed frequency dividers support from dts bindings. Used assigned
  clock frequencies support from CCF instead.
- Reduced the interval while RTC is voluntarily disabled to a simple
  register write in order to avoid any race condition between a possbile
  rollover and 'suspend' callback execution flow.
- Updated bindings documentation with respect to clocking support.
- Fixed a potential unused variable warning reported by kernel test robot.
- Updated to usage of 'devm_rtc_allocate_device' and 'devm_rtc_register_device'
  instead of deprecated 'devm_rtc_device_register'.

Ciprian Marian Costea (4):
  dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
  rtc: s32g: add NXP S32G2/S32G3 SoC support
  arm64: defconfig: add S32G RTC module support
  MAINTAINERS: add NXP S32G RTC driver

 .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml |  72 +++
 MAINTAINERS                                   |   2 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/rtc/Kconfig                           |  11 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-s32g.c                        | 529 ++++++++++++++++++
 6 files changed, 616 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
 create mode 100644 drivers/rtc/rtc-s32g.c

-- 
2.45.2



Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8F5E76BD8D
	for <lists+linux-rtc@lfdr.de>; Tue,  1 Aug 2023 21:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbjHATVC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 1 Aug 2023 15:21:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231158AbjHATVB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 1 Aug 2023 15:21:01 -0400
Received: from CAN01-YQB-obe.outbound.protection.outlook.com (mail-yqbcan01on2076.outbound.protection.outlook.com [40.107.116.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1403D1BF1;
        Tue,  1 Aug 2023 12:20:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWL4ZXapY6m8BFsvZWMUB6p2OzT4ErwmrXOZFnw1ha8b1Ca0rSxqLWMmjGRBrQkXSH73L+hIPQ3KpEyahjSmQQR/fdRnXGNA4rNZ42S5BBpgrxQlAyS7sO4VdoozOh64Movy13gVtLW0NxrE2gzP3Cw0EDnOGh+MjgJnScsG4bLK56Q93wEgnmOQ2eH2Gvst4LAv659ETDD7uNhX8enRfrkWm2CEHvCwpxBfhAztFL5i27hbPgYX3TvXf54niLpk0xC472Mb0X0jFg7ex410JnsxhREKDdn7qEf1o6DLix5gB4VvL1dFJ+l+51Pnw1K8eNuJhLSNexEFxzR8rmHVWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgyZ7z+VvO4zav5J/sv74Mg+hjg4c6vsf6Exbsrp8KM=;
 b=CInuyyfKS7w/n9akwOf9AnCpBnVaY22bCJ06+AIdimIf92bU4pTN0K+d4jEJr6zq/EtC9StOXcuMJYD2RYzndhHc8Y1+MoAcvBzQK92AkUr40PlDmW0rXoaT6mKBiAMjTgniz0Stn+HWstQGLz4JCTmfOT0hM2Tm+f+UIcZZxoWg/7PvxiH8nU8cdVyMIboJ9b+icS9NVg2LKM+END6GG/IGr3cwZ6m8hUyiuj8SL/LBNNqAj4ApijxLaHgkq5J3xaBwH2l2zkBatNESJrSd4UGYPC1syLUgV/qNJS0o7JNC0RXcUSc71g8NHvnMMmG7t2S+Wn74JnRc9OfaH5B4Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dimonoff.com; dmarc=pass action=none header.from=dimonoff.com;
 dkim=pass header.d=dimonoff.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dimonoff.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgyZ7z+VvO4zav5J/sv74Mg+hjg4c6vsf6Exbsrp8KM=;
 b=OvPSXWi3+e+GF4X9LH7l6ORt1zJjfADE4BTur25SQedk9r7FfB5KddGhugAxc32C4s7idSAR+OccwuxG3IzgFiD22O1EnVGxk7D267R1LzKXWCSDwBUHff9INtfLnQVz3XRbLOD+0h5DURwsOqmignQLMFDfMyysDWU4JtYZXvA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dimonoff.com;
Received: from YT3PR01MB8916.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:7d::19)
 by YQBPR0101MB5283.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:41::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Tue, 1 Aug
 2023 19:20:55 +0000
Received: from YT3PR01MB8916.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::5083:91db:4a24:84c9]) by YT3PR01MB8916.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::5083:91db:4a24:84c9%5]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 19:20:55 +0000
Date:   Tue, 1 Aug 2023 15:20:53 -0400
From:   Hugo Villeneuve <hvilleneuve@dimonoff.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] rtc: pcf2127: fix error code in pcf2127_enable_ts()
Message-Id: <20230801152053.3eef3ce9c4a11070dc68c3b8@dimonoff.com>
In-Reply-To: <55b9c84b-9d21-444f-b91a-cf9316b65833@moroto.mountain>
References: <55b9c84b-9d21-444f-b91a-cf9316b65833@moroto.mountain>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0051.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:88::25) To YT3PR01MB8916.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:7d::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT3PR01MB8916:EE_|YQBPR0101MB5283:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fd5b13c-accd-4029-52bb-08db92c46da5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IUBDSkI+iky5cIg1T4+Zxjyzz4QSTJtdhopjfNSVWFk6i7Iqaw8+DNJTP6bB/MXsnBhVM78qrxJCBVbJA50/zoKnz0UVdZ0esOrf82lS4UmB9LH7J95ZaiXvZzfYOmrnPnrAHW+lhWHyWGXCfjMwuU2i8uVq3IZd/b7/MHEMk93ivUrAIIq9NwBjEGgO3i2B6qGcgg1fnBrSo9/PF2Xl0DVMqsVsqN3HRFLbAU67h2eUMGpdTBEe1kD68RSNDzzuYChq93+2TxVrKHPq2mnCxebWGmCXCbTYcNx6mXvM4+RXjlZwpH+Gi0qgSy2UOziMq5g6kDa1+xPINjQXN/Q7awXbep3DBSoVMsDfkBPgXmfOuyOEKc5y4Y1XxxnPqPKJNbohPcutzLoKXW+tVSSrw66ardtj2Tke8msL+g6WbmZ2WgbKDkJfHR5hXNI42VCsROpbHyttMnz2UFh78Tqt+fH3bXM+wHLqp4Xh1OqKD/L60JC6gHIWgaRXxKrzeKYbORIfjlvC8f4cBlMdey2K19FHvEODZ1L0mCt/kqkUvHdZdIg2KrDQkfyyN05svqwo
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB8916.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(366004)(376002)(39850400004)(396003)(451199021)(8936002)(8676002)(36756003)(6486002)(41300700001)(478600001)(52116002)(2616005)(2906002)(4744005)(83380400001)(316002)(186003)(86362001)(6506007)(1076003)(5660300002)(38100700002)(6512007)(54906003)(6916009)(4326008)(66476007)(66556008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zdlB54sWIz3fc3ACHD0gvhocf8mbXdTmn30E5HpOWgtHlTmZ8V9Y00Hz5H5C?=
 =?us-ascii?Q?gjvck3b/42UMV59Qp0Fprei/72qLudU8LoxXuidYIoxoyFYxZu1qcGiJLq3A?=
 =?us-ascii?Q?9McK3RJf8uO+MJyNngmXzlvhvmx+WmEocemNdCO4lTkhIbUPV1AJof3HQuCL?=
 =?us-ascii?Q?p9CZDDfHCKBbV7rVoOM7N1BfUrlhlPrlpEGl9PNurc3/d5Pj6KIJtpXLTs+J?=
 =?us-ascii?Q?Eoygn+YD5yKWVUiSJMu4GI0W8gI1yHX4L5JYLY5k34tA0gGHaFY5SOlTE4+W?=
 =?us-ascii?Q?N958iomdTVZnJJf6yC42tr3zRXNuFEkKCmt/XHcX46MmFctybKq0bLjbO5Tv?=
 =?us-ascii?Q?dhCmKQlg6R/bjOaHQFRd9gn7PCFwTOvLpyoS7iTTmzrIWTgkElBbj7ABvW9M?=
 =?us-ascii?Q?Sl6qVk/ssmM28KQUys8RHYomgKCQfBcGsamqI7j2Bc1/AWy9o4/URRwub5C1?=
 =?us-ascii?Q?242h2CUvvnvJUqqYn7qgkNROLs+XeOKAuYR5tFlsaptOn6Sxl34enRXaJzgl?=
 =?us-ascii?Q?Aue8Rk2nXlRPeccaucIvTtmPjxctxMVYpefA5dH52nnqoxhyuf+9sn3+vKCr?=
 =?us-ascii?Q?P/9TAi6QO3ATawvuuzPxSAaET3MOcOWLAExejlsS2cV5s6HeomO+GoylsJpa?=
 =?us-ascii?Q?Ro1juyri+HZuSneTVw+MWT6g6NLLxd0zjywt9m2y+l5wFotqDlUSMfN4ytfK?=
 =?us-ascii?Q?MSK/MbYXzsmrjM9HieUzvPj+lMu0/LdqNtHlpahqliQwLwyg5/XmwT3VkyGL?=
 =?us-ascii?Q?mJibjjsnn5hZI0lOoiEqissJwudOLL3Uq2s7Pgtmu9Vm/4scY8yeP5JJi2wC?=
 =?us-ascii?Q?jzsum+UhCBN0IM9FmX0SXO1rGQcn+BKc4qb+rMz1O+VAOpRRtKS01dpVvwmG?=
 =?us-ascii?Q?wClPSwhMG/Yqnw6r2hTpgPqaCgZ8GXCJPzbQvSUozWB5XEXytRoHotbAs5oW?=
 =?us-ascii?Q?gUeDdBFs0h1WA+M6pZbdJExAzvu07BprjlwKFAWDD50zAK4np6ysY2qZM3Nx?=
 =?us-ascii?Q?xYipT2uSrSaGJwRa6i2v5K0Zsqg9x2PDc4dPL0yU+O3FhppTjV+rGkF99QZO?=
 =?us-ascii?Q?NbcqUJFRuzc8w9y+iYXDdim8TDHyNxRAF0Im/s20f3fu0uBPmyKBCz6aawIv?=
 =?us-ascii?Q?/UAKGYkAzCP2e5YNJGZODYYdbC2zWMlu3RxsdZSbM4ofddgaUwkqBH4+g8Tr?=
 =?us-ascii?Q?rsqlelipxf5EfEuB1175nwKQHT+qhxQqvOPInyuE4HkK9+zHj1j5I/3CbOJ4?=
 =?us-ascii?Q?xF5W3y15mvcPLyrzc1cVP04z//Qg1NFD8zo60QO3wbs3/bhMRGHanuVRTAtv?=
 =?us-ascii?Q?G6mbNHXEuugpOid5ZGaaPUo9n4vxdTD1tAnco6BlS9DKDMRJe+LKjU2PfdXl?=
 =?us-ascii?Q?yQBGjWCWZY/HCfXPySWzHJJoNai09jtRV/do122sIxTHFW8TSTax2P1zRbz3?=
 =?us-ascii?Q?k9KjeAovdCE8gH6jw3P8xffq7eODMYgwTMMgqXh3yVI6rjWsvveBtkEELio+?=
 =?us-ascii?Q?9cf099y3NlaLqUL2agTb715GCe55DIyj6BRTe7oMKAzzxnVdWtLjlv3oxTwP?=
 =?us-ascii?Q?IJk2ush8GbG46tPnbyEW/+kOsmwec5WKFhQDGXeDapdWWoWLs2wP1Y+f3jDk?=
 =?us-ascii?Q?9MfomOFnsHxvpRfFI8HXuOfkIwpwh+m178KdH1gAHOVv/I8wwL7bAGnF1KGk?=
 =?us-ascii?Q?3Q7JrQ=3D=3D?=
X-OriginatorOrg: dimonoff.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd5b13c-accd-4029-52bb-08db92c46da5
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB8916.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 19:20:55.5759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c4063547-e5e6-4866-a386-58c3965da102
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A5ol3FpwMYIKTsc1ShrHwEAp27zuhJX4JT70+RJRkrMkRVMe+0VzMfVVPPNvCmDf+eiH1xgFthJ1J/SmYGylMy+0EyjfPN4qNj+tSfq5yi0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB5283
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 31 Jul 2023 17:09:30 +0300
Dan Carpenter <dan.carpenter@linaro.org> wrote:

> This error path accidentally returns success.  Return -EINVAL instead.
> 
> Fixes: 420cc9e850db ("rtc: pcf2127: add support for multiple TS functions")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> From static analysis.  Not tested.
> 
>  drivers/rtc/rtc-pcf2127.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index 78141bb06ab0..988cad171174 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -1060,7 +1060,7 @@ static int pcf2127_enable_ts(struct device *dev, int ts_id)
>  	if (pcf2127->cfg->ts[ts_id].gnd_detect_bit == 0) {
>  		dev_err(dev, "%s: tamper detection to GND configuration invalid\n",
>  			__func__);
> -		return ret;
> +		return -EINVAL;
>  	}
>  
>  	/*
> -- 
> 2.39.2
 
Reviewed-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>

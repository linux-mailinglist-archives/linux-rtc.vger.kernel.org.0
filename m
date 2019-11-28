Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09E7410C4D7
	for <lists+linux-rtc@lfdr.de>; Thu, 28 Nov 2019 09:20:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727042AbfK1IUV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 28 Nov 2019 03:20:21 -0500
Received: from mail-eopbgr790040.outbound.protection.outlook.com ([40.107.79.40]:23958
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726882AbfK1IUV (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 28 Nov 2019 03:20:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bEF2bwfkYdyxSDG5ucIHzEFRj5EzbKbb/ZT3JzBnX/sIXEBTStF8eHguWJ0vgkpk0aHwFAcP6S9Lavze8CRixCcbj04VLTHW9jZsObVtqD0IOry79UYckrGBZ2ZRi9QDC9/HcUDDy+a30vfNapaNVRn3358JeyUmI9h8s08edpgHpNIZT23b1cfDh0p3q+JIOf/+325LLpsh0iZUF3J/CbWe/YpZxLhqvDYHWLsDLW59NdZrmiALFpnzucTKBNMJue+IEgidoDXZx664R4ev/8P3/J797jDF6QKsX1/FoobczapsqfYfUKAnE/uMNIMy7L8mIck43XLie+Bit0I5UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8OrlkEZbpA9Zeh8I3PRQMqoTVXzDjk+pWnJrx+WTp2U=;
 b=S7Y+VPep8gzMOPnOThojdWkePlnZtep9E642IYqWfQKgwXL8ISdI2vF+7pK2Z3Vm7wowv3R0DfLFJ3VCtAvpybKQgStSBPYpeZPhvPkqoT6Q7g84rhAt3aWHDinLqQzxld8sBznVAj+xb82A9T7T23CW9/k1naeSYPn3tTD53PNFNx4V7fI+fQerztu1NfhsmllZuOBH6Tb7mfP1SWgUuigbiI5Vs6F7udPvxG7SC/zWg1w4m2qGDgFu/ORhYFTMI7GiuDfQAY9btlXkEomlog6Xi8+BdInMH5JEiUWMgpYGaK1DawWf9avOad4weGkCnxmktSksR0+QmM8aMEY/EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8OrlkEZbpA9Zeh8I3PRQMqoTVXzDjk+pWnJrx+WTp2U=;
 b=KsTE2277+m71LJ1dQScPoqmDaw5eZ5WpD1WxIlw8T3N+5TlhgpK6rWeifhXxc/hz31/P8DlSLTqqu+p9aulgKM0MDH/q6uR5pYSe520BRfmG6m0hysHq9VXrBYlSjMDh6VhTX1Xcr+nf8cMnKBsWt15HGeWhlTEghOP0u3051ZE=
Received: from SN4PR0201CA0032.namprd02.prod.outlook.com
 (2603:10b6:803:2e::18) by BYAPR02MB5942.namprd02.prod.outlook.com
 (2603:10b6:a03:128::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.21; Thu, 28 Nov
 2019 08:20:14 +0000
Received: from SN1NAM02FT049.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::203) by SN4PR0201CA0032.outlook.office365.com
 (2603:10b6:803:2e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.17 via Frontend
 Transport; Thu, 28 Nov 2019 08:20:13 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT049.mail.protection.outlook.com (10.152.72.166) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2474.17
 via Frontend Transport; Thu, 28 Nov 2019 08:20:13 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1iaF25-0002Az-7w; Thu, 28 Nov 2019 00:20:13 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1iaF1z-0002g4-Vq; Thu, 28 Nov 2019 00:20:08 -0800
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id xAS8K2W2032294;
        Thu, 28 Nov 2019 00:20:02 -0800
Received: from [172.30.17.107]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1iaF1t-0002J9-JS; Thu, 28 Nov 2019 00:20:02 -0800
Subject: Re: [PATCH 2/2] rtc: zynqmp: fix invalid read_time before 1 second
To:     Jean-Francois Dagenais <jeff.dagenais@gmail.com>,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        Srinivas Goud <sgoud@xilinx.com>
Cc:     git@xilinx.com, linux-rtc@vger.kernel.org, michal.simek@xilinx.com,
        champagne.guillaume.c@gmail.com, maxime.roussinbelanger@gmail.com
References: <20191128015613.10003-1-jeff.dagenais@gmail.com>
 <20191128015613.10003-2-jeff.dagenais@gmail.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <ca78b7e6-a0c3-745b-1533-6b8424d97623@xilinx.com>
Date:   Thu, 28 Nov 2019 09:19:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191128015613.10003-2-jeff.dagenais@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(376002)(396003)(346002)(189003)(199004)(2870700001)(6636002)(446003)(70586007)(47776003)(336012)(44832011)(426003)(11346002)(316002)(110136005)(65806001)(2616005)(58126008)(65956001)(305945005)(106002)(6246003)(31686004)(36386004)(66574012)(14444005)(9786002)(2906002)(31696002)(5660300002)(36756003)(186003)(26005)(478600001)(76176011)(229853002)(70206006)(50466002)(81156014)(8676002)(4326008)(6666004)(356004)(8936002)(2486003)(81166006)(23676004);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR02MB5942;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 144e62ad-ca17-4c38-e97c-08d773dbcb0c
X-MS-TrafficTypeDiagnostic: BYAPR02MB5942:
X-Microsoft-Antispam-PRVS: <BYAPR02MB5942D503535BB16EB3437601C6470@BYAPR02MB5942.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0235CBE7D0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EbYAHp+zJUDbmq6O1llU5aRqZeWm5OYfWMJsKRFvMsLbHI6G3s/MDn9Wp/A2dd2hmk2Q5juJLEe+OrNJFn5mU3VbIT/R1TwEUOhQU5+/EMTUrUy15hSByT7unjwD8q6sFF+r3vSgES9aVv2sPrHYYSdmzWdiHPJHKMjw3g95Um6sSnTppAd3fFUIBZZmnB9QjQtf7j/KQsy4DJ2IpsSxtoRq0WBClTH98ZzWn0y8FkFRw4bj8A31siBsrJhVKapMA+gHDx+icny5/WfH1JbqnGWW+MQSuEAewyw8mh/2Y5Kii4uGl1t+LixdgrEh9KJ/kA0xC62E+RDaATmujTwAEAfUdKwDGk2+N+lXP06NWRWa4piSvjQlkjl90mC1paSZnX2VATwraXMXqhyQUEMhKF/0jhYK2jZSDmTLXWs1cV+CmEsG5k/UKcYPFEGHOTKe
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2019 08:20:13.6376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 144e62ad-ca17-4c38-e97c-08d773dbcb0c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5942
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 28. 11. 19 2:56, Jean-Francois Dagenais wrote:
> When reaching the read_time implementation before 1 second has elapsed
> since power on, SEC bit from status register is not yet set. read_time
> incorrectly assumes that there is a pending set_time not yet reflected
> in CURRENT_TIME and proceeds to use SET_TIME_READ (RTC_SET_TM_RD in the
> code). This register contains garbage at this moment and this is
> returned as the current time.

How did you test this?

> 
> Here we switch to using the SEC interrupt to signal the pending set time
> operation. The old ISR is renamed xlnx_rtc_alarm_interrupt and a new one
> xlnx_rtc_sec_interrupt is created to handle disabling the SEC interrupt
> once the pending write is known to be complete.
> 
> read_time now detects whether a pending write exists or not using the
> interrupt mask (!interrupt enabled). The interrupt is only enabled when
> actually performing a set_time.
> 
> Signed-off-by: Guillaume Champagne <champagne.guillaume.c@gmail.com>
> Signed-off-by: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
> Tested-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
> ---
>   drivers/rtc/rtc-zynqmp.c | 69 +++++++++++++++++++++++++++++-----------
>   1 file changed, 50 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
> index cb78900ec1f5..9fec89c4f573 100644
> --- a/drivers/rtc/rtc-zynqmp.c
> +++ b/drivers/rtc/rtc-zynqmp.c
> @@ -13,6 +13,7 @@
>   #include <linux/of.h>
>   #include <linux/platform_device.h>
>   #include <linux/rtc.h>
> +#include <linux/spinlock.h>
>   
>   /* RTC Registers */
>   #define RTC_SET_TM_WR		0x00
> @@ -45,6 +46,7 @@ struct xlnx_rtc_dev {
>   	int			alarm_irq;
>   	int			sec_irq;
>   	int			calibval;
> +	spinlock_t		lock;
>   };
>   
>   static int xlnx_rtc_set_time(struct device *dev, struct rtc_time *tm)
> @@ -59,6 +61,8 @@ static int xlnx_rtc_set_time(struct device *dev, struct rtc_time *tm)
>   	 */
>   	new_time = rtc_tm_to_time64(tm) + 1;
>   
> +	spin_lock_irq(&xrtcdev->lock);
> +
>   	/*
>   	 * Writing into calibration register will clear the Tick Counter and
>   	 * force the next second to be signaled exactly in 1 second period
> @@ -68,32 +72,32 @@ static int xlnx_rtc_set_time(struct device *dev, struct rtc_time *tm)
>   
>   	writel(new_time, xrtcdev->reg_base + RTC_SET_TM_WR);
>   
> -	/*
> -	 * Clear the rtc interrupt status register after setting the
> -	 * time. During a read_time function, the code should read the
> -	 * RTC_INT_STATUS register and if bit 0 is still 0, it means
> -	 * that one second has not elapsed yet since RTC was set and
> -	 * the current time should be read from SET_TIME_READ register;
> -	 * otherwise, CURRENT_TIME register is read to report the time
> -	 */
> +	/* Clear sec interrupt status */
>   	writel(RTC_INT_SEC, xrtcdev->reg_base + RTC_INT_STS);
>   
> +	/* Now enable sec interrupt. This ensures our isr will get called, but
> +	 * also signals the read_time function that a SET time is pending, in
> +	 * which case time should be read from SET_TIME_READ instead of
> +	 * CURRENT_TIME registers.
> +	 */
> +	writel(RTC_INT_SEC, xrtcdev->reg_base + RTC_INT_EN);
> +
> +	spin_unlock_irq(&xrtcdev->lock);
> +
>   	return 0;
>   }
>   
>   static int xlnx_rtc_read_time(struct device *dev, struct rtc_time *tm)
>   {
> -	u32 status;
> +	u32 int_mask;
>   	unsigned long read_time;
>   	struct xlnx_rtc_dev *xrtcdev = dev_get_drvdata(dev);
>   
> -	status = readl(xrtcdev->reg_base + RTC_INT_STS);
> +	spin_lock_irq(&xrtcdev->lock);
> +	int_mask = readl(xrtcdev->reg_base + RTC_INT_MASK);
>   
> -	if (status & RTC_INT_SEC) {
> -		/*
> -		 * RTC has updated the CURRENT_TIME with the time written into
> -		 * SET_TIME_WRITE register.
> -		 */
> +	if (int_mask & RTC_INT_SEC) {
> +		/* No set_time pending, use the CURRENT_TIME register */
>   		read_time = readl(xrtcdev->reg_base + RTC_CUR_TM);
>   	} else {
>   		/*
> @@ -105,6 +109,9 @@ static int xlnx_rtc_read_time(struct device *dev, struct rtc_time *tm)
>   		 */
>   		read_time = readl(xrtcdev->reg_base + RTC_SET_TM_RD) - 1;
>   	}
> +
> +	spin_unlock_irq(&xrtcdev->lock);
> +
>   	rtc_time64_to_tm(read_time, tm);
>   
>   	return 0;
> @@ -173,14 +180,36 @@ static const struct rtc_class_ops xlnx_rtc_ops = {
>   	.alarm_irq_enable = xlnx_rtc_alarm_irq_enable,
>   };
>   
> -static irqreturn_t xlnx_rtc_interrupt(int irq, void *id)
> +static irqreturn_t xlnx_rtc_sec_interrupt(int irq, void *id)
> +{
> +	struct xlnx_rtc_dev *xrtcdev = (struct xlnx_rtc_dev *)id;
> +	unsigned int status;
> +
> +	status = readl(xrtcdev->reg_base + RTC_INT_STS);
> +	/* Check if interrupt asserted */
> +	if (!(status & RTC_INT_SEC))
> +		return IRQ_NONE;
> +
> +	/* Clear RTC_INT_SEC interrupt only */
> +	writel(RTC_INT_SEC, xrtcdev->reg_base + RTC_INT_STS);
> +
> +	spin_lock(&xrtcdev->lock);
> +
> +	writel(RTC_INT_SEC, xrtcdev->reg_base + RTC_INT_DIS);
> +
> +	spin_unlock(&xrtcdev->lock);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t xlnx_rtc_alarm_interrupt(int irq, void *id)
>   {
>   	struct xlnx_rtc_dev *xrtcdev = (struct xlnx_rtc_dev *)id;
>   	unsigned int status;
>   
>   	status = readl(xrtcdev->reg_base + RTC_INT_STS);
>   	/* Check if interrupt asserted */
> -	if (!(status & (RTC_INT_SEC | RTC_INT_ALRM)))
> +	if (!(status & RTC_INT_ALRM))
>   		return IRQ_NONE;
>   
>   	/* Clear RTC_INT_ALRM interrupt only */
> @@ -202,6 +231,8 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
>   	if (!xrtcdev)
>   		return -ENOMEM;
>   
> +	spin_lock_init(&xrtcdev->lock);
> +
>   	platform_set_drvdata(pdev, xrtcdev);
>   
>   	xrtcdev->rtc = devm_rtc_allocate_device(&pdev->dev);
> @@ -221,7 +252,7 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
>   	if (xrtcdev->alarm_irq < 0)
>   		return xrtcdev->alarm_irq;
>   	ret = devm_request_irq(&pdev->dev, xrtcdev->alarm_irq,
> -			       xlnx_rtc_interrupt, 0,
> +			       xlnx_rtc_alarm_interrupt, 0,
>   			       dev_name(&pdev->dev), xrtcdev);
>   	if (ret) {
>   		dev_err(&pdev->dev, "request irq failed\n");
> @@ -232,7 +263,7 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
>   	if (xrtcdev->sec_irq < 0)
>   		return xrtcdev->sec_irq;
>   	ret = devm_request_irq(&pdev->dev, xrtcdev->sec_irq,
> -			       xlnx_rtc_interrupt, 0,
> +			       xlnx_rtc_sec_interrupt, 0,
>   			       dev_name(&pdev->dev), xrtcdev);
>   	if (ret) {
>   		dev_err(&pdev->dev, "request irq failed\n");
> 

Srinivas: can you please take a look at this patch?

Thanks,
Michal

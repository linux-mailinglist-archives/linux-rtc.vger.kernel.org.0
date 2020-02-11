Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6E8C158CDD
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Feb 2020 11:41:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728380AbgBKKlA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 11 Feb 2020 05:41:00 -0500
Received: from mail-dm6nam11on2087.outbound.protection.outlook.com ([40.107.223.87]:6054
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728312AbgBKKk7 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 11 Feb 2020 05:40:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T/GY1EviXSUav3c98uuwkiZJUJLafJkKc5YQholUVigdQ8KeEQimt12F3nP7NW6tFpaDhjhjRC4iQWGoqNG0YbgrELQW2gcPjKbEBItek+R6IcqzLDerxchsRUQ+3mH/p1jshfKUuZkfwi3c4GJoofy8jThPpOPhfX2dzNnfn07TEB3aqD/14iw3K5dhBhDsoPzzv/LZmYPdad02JQo+nEFcLtJEX9jSQ7JPJk6OcdQmTDN+edDtM8Hwz5jgdnUVNVhNVinkcFjX+PXoP65ekWiRszmi9CSMnFUpN/WQ/udTi7aPtBlpUvOh79mWDAbjGgGC2A8J4P5OpfeDM7aIOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3DmHqtvvKJtk7XtH+7ii+mWxur30gvNKv4wQkI+ShVw=;
 b=YP+uND4taZXNLpuRElOiDTB9AdmcewnqiMpOMEld4cJCNAzTnpAHEvFfhzyqsTTjfynp68K2sq22mTef4hKCYHIG982FavHxassJCoOsBfoGzMrhD00KugAADvNP5FyUDbR2kdPzxD3puCAvpoVqBmNQ9/Cwl+wKaFdPjiDfxMgkcU09r0JGIHVoqAwANZ9E1RSqMHTJpd/8HvAFfCKywoPRyLdtNWAz7l/Tnh4XVo5jrbY/+TZYE2r5u1SvJ4bug4BW4aXAdf66VkWhL7PuT7RYt6CZ9qPB5SNsOSM71p5TlAabk6pmKRiYiO0PnGY1WRxWcHKdnKFRqq2W8Pgd7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3DmHqtvvKJtk7XtH+7ii+mWxur30gvNKv4wQkI+ShVw=;
 b=AGu5ubDy4yDMUFpA+Uweuh3DHw/GLJ1SK2QO7nuMV6Do4bjQRwzmcsq0DLIG2yKkl7BVnp2UPh/gJHxyXjwmH/Y92rvFZ5IIW9u0fzQk7+ZVgc0ZEwXqqlVL977fSIqVpVGVvL/kXhAE7JM14eck3ZY9ZS402LZZPqboeLxZjy4=
Received: from CY4PR02CA0029.namprd02.prod.outlook.com (2603:10b6:903:117::15)
 by BY5PR02MB6932.namprd02.prod.outlook.com (2603:10b6:a03:23a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.27; Tue, 11 Feb
 2020 10:40:54 +0000
Received: from CY1NAM02FT034.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::204) by CY4PR02CA0029.outlook.office365.com
 (2603:10b6:903:117::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.24 via Frontend
 Transport; Tue, 11 Feb 2020 10:40:54 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT034.mail.protection.outlook.com (10.152.75.190) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2707.21
 via Frontend Transport; Tue, 11 Feb 2020 10:40:54 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1j1SyL-0007d2-WB; Tue, 11 Feb 2020 02:40:54 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1j1SyG-00039I-SZ; Tue, 11 Feb 2020 02:40:48 -0800
Received: from [172.30.17.107]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1j1SyC-00038S-3f; Tue, 11 Feb 2020 02:40:44 -0800
Subject: Re: [PATCH] rtc: zynqmp: Clear alarm interrupt status before
 interrupt enable
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Michal Simek <monstr@monstr.eu>
Cc:     Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Srinivas Goud <sgoud@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        linux-rtc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        linux-arm <linux-arm-kernel@lists.infradead.org>,
        git <git@xilinx.com>
References: <1576155618-7933-1-git-send-email-srinivas.neeli@xilinx.com>
 <CAHTX3dKSq1oTzkoRv3wK3rhkc1r0rOiQhFKmgsYbtG_uvOfAJg@mail.gmail.com>
 <20200211103939.GD3527@piout.net>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <49ee656d-0d5e-c97f-f77e-04b1f1a187b4@xilinx.com>
Date:   Tue, 11 Feb 2020 11:40:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211103939.GD3527@piout.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(396003)(346002)(39860400002)(376002)(136003)(199004)(189003)(426003)(54906003)(2616005)(316002)(5660300002)(36756003)(2906002)(110136005)(31686004)(478600001)(4326008)(336012)(356004)(186003)(107886003)(6666004)(26005)(70206006)(70586007)(81156014)(44832011)(81166006)(8676002)(66574012)(31696002)(9786002)(8936002);DIR:OUT;SFP:1101;SCL:1;SRVR:BY5PR02MB6932;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c9c2d2d-3d22-4ce5-992b-08d7aededf25
X-MS-TrafficTypeDiagnostic: BY5PR02MB6932:
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Antispam-PRVS: <BY5PR02MB6932ED27053BA25B3FC9DF10C6180@BY5PR02MB6932.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0310C78181
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SO1nD3DWvbgmSK22ZlpwEYWUovxcr1ZA7WWfxj3XsUT59d+zwDDIjlsOKpK8i6dx2BIhynN/nHif8IxkLpNngbix02J+e+LLEnRqMe+eQf/JKYi9GETXDSORFtRLvCxNpNCVWYlrIPj2f2ElNmu3CSRuJ19NamkFyoS8XdtkuWB2k3Xb4aWPAu8WkXFIMLqHoKKSZaFxGfNG9hKme/fteVoD92iCroW6M8mRfzztyhJ2xpS0GMi7LW0htLKSdEou4yZVhWDWLz/tCGv75aY8wUeAXvoP57+Y2JB71Z+cPQxwLGRQfnqfDqXVnRvlhb60lebrqLUkPNOuu14Qm0KzhbzHDqoQDVwSFKTogpwPxeH/S+d3jmtmo1YOV+b86px829StNMT41J8c7+iN9eHt/5lfJgtvPGRnThyMNJq7tajfFTKz9j24jx8ZfXYGw5iB
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2020 10:40:54.4237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c9c2d2d-3d22-4ce5-992b-08d7aededf25
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6932
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11. 02. 20 11:39, Alexandre Belloni wrote:
> On 10/02/2020 12:48:14+0100, Michal Simek wrote:
>> Hi,
>>
>> čt 12. 12. 2019 v 14:01 odesílatel Srinivas Neeli
>> <srinivas.neeli@xilinx.com> napsal:
>>>
>>> Fix multiple occurring interrupts for alarm interrupt. RTC module doesn't
>>> clear the alarm interrupt status bit immediately after the interrupt is
>>> triggered.This is due to the sticky nature of the alarm interrupt status
>>> register. The alarm interrupt status register can be cleared only after
>>> the second counter outruns the set alarm value. To fix multiple spurious
>>> interrupts, disable alarm interrupt in the handler and clear the status
>>> bit before enabling the alarm interrupt.
>>>
>>> Fixes: 11143c19eb57 ("rtc: add xilinx zynqmp rtc driver")
>>> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
>>> ---
>>>  drivers/rtc/rtc-zynqmp.c | 29 ++++++++++++++++++++++++-----
>>>  1 file changed, 24 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
>>> index 5786866c09e9..d311e3ef1f21 100644
>>> --- a/drivers/rtc/rtc-zynqmp.c
>>> +++ b/drivers/rtc/rtc-zynqmp.c
>>> @@ -38,6 +38,8 @@
>>>
>>>  #define RTC_CALIB_DEF          0x198233
>>>  #define RTC_CALIB_MASK         0x1FFFFF
>>> +#define RTC_ALRM_MASK          BIT(1)
>>> +#define RTC_MSEC               1000
>>>
>>>  struct xlnx_rtc_dev {
>>>         struct rtc_device       *rtc;
>>> @@ -124,11 +126,28 @@ static int xlnx_rtc_alarm_irq_enable(struct device *dev, u32 enabled)
>>>  {
>>>         struct xlnx_rtc_dev *xrtcdev = dev_get_drvdata(dev);
>>>
>>
>> here shouldn't be empty line.
>>
>>> -       if (enabled)
>>> +       unsigned int status;
>>> +       ulong timeout;
>>> +
>>> +       timeout = jiffies + msecs_to_jiffies(RTC_MSEC);
>>> +
>>> +       if (enabled) {
>>> +               while (1) {
>>> +                       status = readl(xrtcdev->reg_base + RTC_INT_STS);
>>> +                       if (!((status & RTC_ALRM_MASK) == RTC_ALRM_MASK))
>>> +                               break;
>>> +
>>> +                       if (time_after_eq(jiffies, timeout)) {
>>> +                               dev_err(dev, "Time out occur, while clearing alarm status bit\n");
>>> +                               return -ETIMEDOUT;
>>> +                       }
>>> +                       writel(RTC_INT_ALRM, xrtcdev->reg_base + RTC_INT_STS);
>>> +               }
>>> +
>>>                 writel(RTC_INT_ALRM, xrtcdev->reg_base + RTC_INT_EN);
>>> -       else
>>> +       } else {
>>>                 writel(RTC_INT_ALRM, xrtcdev->reg_base + RTC_INT_DIS);
>>> -
>>> +       }
>>
>> And here it was good to have empty line.
>>
>>>         return 0;
>>>  }
>>>
>>> @@ -183,8 +202,8 @@ static irqreturn_t xlnx_rtc_interrupt(int irq, void *id)
>>>         if (!(status & (RTC_INT_SEC | RTC_INT_ALRM)))
>>>                 return IRQ_NONE;
>>>
>>> -       /* Clear RTC_INT_ALRM interrupt only */
>>> -       writel(RTC_INT_ALRM, xrtcdev->reg_base + RTC_INT_STS);
>>> +       /* Disable RTC_INT_ALRM interrupt only */
>>> +       writel(RTC_INT_ALRM, xrtcdev->reg_base + RTC_INT_DIS);
>>>
>>>         if (status & RTC_INT_ALRM)
>>>                 rtc_update_irq(xrtcdev->rtc, 1, RTC_IRQF | RTC_AF);
>>> --
>>> 2.7.4
>>
>> Other then these two above things look good.
>>
>> Alexandre: Any issue with this patch?
>>
> 
> No issue, I was kind of waiting for your review. I'll take the patch
> once your comments are addressed.

Ok. Thanks,
Michal



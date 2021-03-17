Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE1A833ED10
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Mar 2021 10:33:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbhCQJcr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 17 Mar 2021 05:32:47 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:41352 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbhCQJcn (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 17 Mar 2021 05:32:43 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4F0lLd61srz1qs3H;
        Wed, 17 Mar 2021 10:32:41 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4F0lLd4X2xz1r1MT;
        Wed, 17 Mar 2021 10:32:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id OUpL12vtdwYq; Wed, 17 Mar 2021 10:32:40 +0100 (CET)
X-Auth-Info: LYzhXtsDzwoP8l6wMTCp3dtKemNxNs492NXkKUWXCRo=
Received: from [10.88.0.186] (dslb-084-056-254-233.084.056.pools.vodafone-ip.de [84.56.254.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Wed, 17 Mar 2021 10:32:40 +0100 (CET)
Subject: Re: [PATCH v5] rtc: rx6110: add ACPI bindings to I2C
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     johannes hahn <johannes-hahn@siemens.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        werner zeh <werner.zeh@siemens.com>,
        henning schild <henning.schild@siemens.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        martin mantel <martin.mantel@siemens.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        kernel test robot <lkp@intel.com>
References: <20210317075228.683184-1-ch@denx.de>
 <CAHp75VdRFqK6Tp+dFCHb_6ZBR32mNRLgyRKaMky43aoj1MOjcw@mail.gmail.com>
From:   Claudius Heine <ch@denx.de>
Organization: Denx Software Engineering
Message-ID: <3215fc7e-ae1d-4e51-51d0-24ff386419bd@denx.de>
Date:   Wed, 17 Mar 2021 10:32:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdRFqK6Tp+dFCHb_6ZBR32mNRLgyRKaMky43aoj1MOjcw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Andy,

On 2021-03-17 10:28, Andy Shevchenko wrote:
> On Wed, Mar 17, 2021 at 9:56 AM Claudius Heine <ch@denx.de> wrote:
>>
>> From: Johannes Hahn <johannes-hahn@siemens.com>
>>
>> This allows the RX6110 driver to be automatically assigned to the right
>> device on the I2C bus.
> 
> Thanks for an update!
> 
>> Signed-off-by: Johannes Hahn <johannes-hahn@siemens.com>
>> Co-developed-by: Claudius Heine <ch@denx.de>
>> Signed-off-by: Claudius Heine <ch@denx.de>
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
>> Reported-by: kernel test robot <lkp@intel.com>
> 
> This is usually for patches that do fix found problems, here it's a
> completely new item and the report was done in the middle of the
> development. That said, you may give credit to LKP by just mentioning
> it in the comments section (after the cutter '---' line). I'll leave
> this to Alexandre and Alessandro to decide if you need a resend or
> they may remove it when applying. (In my opinion resend is not needed
> right now)
Ok. Thanks a lot for your reviews and patience!

regards,
Claudius

Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49E062A90C2
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Nov 2020 08:52:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbgKFHwC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 6 Nov 2020 02:52:02 -0500
Received: from mail-out.m-online.net ([212.18.0.9]:54953 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbgKFHwB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 6 Nov 2020 02:52:01 -0500
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4CSCJv5f2nz1qs40;
        Fri,  6 Nov 2020 08:51:59 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4CSCJv4tXcz1qsXK;
        Fri,  6 Nov 2020 08:51:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id Ybuveroolus7; Fri,  6 Nov 2020 08:51:58 +0100 (CET)
X-Auth-Info: BY844SkXa5gUbu0GGaOIMAyfkZxy2x9HqQ7e/5kNlZ0=
Received: from [10.88.0.186] (dslb-088-074-220-167.088.074.pools.vodafone-ip.de [88.74.220.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Fri,  6 Nov 2020 08:51:58 +0100 (CET)
Subject: Re: [PATCH 0/2] Adding I2C support to RX6110 RTC
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Henning Schild <henning.schild@siemens.com>,
        Johannes Hahn <johannes-hahn@siemens.com>
References: <20201104102629.3422048-1-ch@denx.de>
 <20201105221451.GH1034841@piout.net>
From:   Claudius Heine <ch@denx.de>
Organization: Denx Software Engineering
Message-ID: <69f2396b-c81d-fe65-eb91-3c7a86c8d769@denx.de>
Date:   Fri, 6 Nov 2020 08:51:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201105221451.GH1034841@piout.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alex,

On 2020-11-05 23:14, Alexandre Belloni wrote:
> Hello Claudius!
> 
> It has been a while ;)

yeah, lots of downstream stuff for me :/

> 
> On 04/11/2020 11:26:27+0100, Claudius Heine wrote:
>> Hi,
>>
>> this patch introduces I2C support to the RX6110 RTC driver and also adds
>> an ACPI identifier to it.
>>
>> Since we are also pushing the coreboot changes for the ACPI table
>> upstream in parallel, we are free to name this ACPI entry however we
>> like it seems. So any feedback on that would be welcome ;)
>>
> 
> I don't care too much about ACPI so if you are really looking for advice
> there, I guess you should ask seom of the ACPI guys (but I guess you are
> free to choose whatever you want).

As Henning said, we are also getting feedback from the coreboot people.

See you hopefully soon again, when all this sitting at home is over.

regards,
Claudius

Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A79B35D10
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Jun 2019 14:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727607AbfFEMnW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 5 Jun 2019 08:43:22 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44209 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727341AbfFEMnW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 5 Jun 2019 08:43:22 -0400
Received: by mail-lf1-f68.google.com with SMTP id r15so18946163lfm.11;
        Wed, 05 Jun 2019 05:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Vnxt4/lgx61Y+LGTYa1gbOrzarCfTGoHPTnXkUV0ghY=;
        b=NoNspzM6txCWkvf1u5H3nuD494ovlx2gdDxTWi2m4ijP2GVJ7qzBLWiRskddBGDV4R
         lxlHoC9GynJUp+ezWLJM7WFN9O5H8keYcCKIG4hpttOJ2pyzyjqn8d0VZoCVYdNUFIfS
         1IBL+xcaIyF/eqAxt66Bl4cuuAMOIcyLEUJcqLvmlwFkMtcU+t2BIx4uirs6uwoR100R
         PDXAsdoQSt3u0YJGeZmw0oJfcF8GAvygfALJHEhtB1bIh7ow9kATZQ6lR0jUZMULfXDS
         rresDiPf3ezs8G/bQz0ULTLtRdh+YeX9yQf0kPwjyhriJDVemU1yie33w4eO7taBI/sv
         6rCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Vnxt4/lgx61Y+LGTYa1gbOrzarCfTGoHPTnXkUV0ghY=;
        b=t+9e+vSv5H52HMtFybpkl6bAYSdy2jjvlfX1Z8mmTlXPhj0Nn5U0tQM7QEASDeE040
         Fm5IL8hU1RepmuSqKbkKDL5HXtsta0Na9LORlj64UVFN30LrJjAVqPy5ptU7D4oz9w3e
         5Dbb4MOTOpugWh3dN0trZsh1bMx+UbSTB7UeVY1mHIbwMRSZydCOaiZ8GY8pSKOGh+Wz
         KXgV/vhI9oqtWgrADOxlfY4+Xtm18RZvlivS6UvisxWZ2xuq3o4b4Yw7YoBa33TWzoe2
         6ddh6Y3ly3hSOE6fgyDLBtymFgcx+IC4vURo0QK108DABicd9KCmwPlPK0iWRzS2f+7t
         k/VA==
X-Gm-Message-State: APjAAAXpkwpTBmlX7Hv3SxzVirpHqGkMz7qiu8PZ5YFZpmeEcMopM2II
        A18x8hCarnTN20pHA1dgxzwkNbIJ
X-Google-Smtp-Source: APXvYqy6ozufNv9bgd8rZ6WD8T9wKGSeLSrX5pYzIadpXvue/zzho5+1Z80LY/df2zjKI41rMKCTsA==
X-Received: by 2002:a19:6a07:: with SMTP id u7mr16853914lfu.74.1559738599438;
        Wed, 05 Jun 2019 05:43:19 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.35.141])
        by smtp.googlemail.com with ESMTPSA id z12sm1092101lfg.67.2019.06.05.05.43.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 05:43:18 -0700 (PDT)
Subject: Re: [PATCH v1] rtc: tegra: Drop MODULE_ALIAS
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190605122613.21303-1-digetx@gmail.com>
 <20190605123327.GB724@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3cc5b0f5-83ae-23b8-e064-652300b93aae@gmail.com>
Date:   Wed, 5 Jun 2019 15:43:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190605123327.GB724@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

05.06.2019 15:33, Thierry Reding пишет:
> On Wed, Jun 05, 2019 at 03:26:13PM +0300, Dmitry Osipenko wrote:
>> RTC driver was converted to OF driver long time ago. The MODULE_ALIAS
>> macro has no effect for the OF drivers since the alias is overridden by
>> the drivers core to follow the OF naming convention of the driver's alias,
>> which is based on the device-tree matching name.
>>
>> $ cat /sys/devices/soc0/7000e000.rtc/modalias
>> of:NrtcT(null)Cnvidia,tegra20-rtc
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/rtc/rtc-tegra.c | 1 -
>>  1 file changed, 1 deletion(-)
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> 

Thanks!

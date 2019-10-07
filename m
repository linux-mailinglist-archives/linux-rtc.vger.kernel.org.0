Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31094CE1BC
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Oct 2019 14:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727511AbfJGMb5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 7 Oct 2019 08:31:57 -0400
Received: from mail-pf1-f170.google.com ([209.85.210.170]:38601 "EHLO
        mail-pf1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727467AbfJGMb5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 7 Oct 2019 08:31:57 -0400
Received: by mail-pf1-f170.google.com with SMTP id h195so8577381pfe.5;
        Mon, 07 Oct 2019 05:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3gI7bpdbWjmVG6mgR1rp7nZKPq7PDSoA3GLqSGZYdkA=;
        b=SthJ+vH9MEWI1q1T3DBrvlIFKm+tNDIYlvD00339dKu2hUYpiiCWjAH+UafsNTZ4ra
         P6aQiPqip3AV6XZC42uixTbbISWjFmQZsmq0c69Ut4EeZywF9vGJnyqOpazeA0nPUTQ9
         ikcyb6yboSqgkw58TDbT2PNNf+B1y1/XtM3981zaWHdHmY2J+p3c9tPD/3rgb6ZWsDF+
         3UA3bU171vdznt6Kzk0qb5hujBVdOAH70MH7DYluR66+mAKCLKNI/xoFZ4mn06YwMQlP
         OIrr3H8W+Y0ldTHW4EteElzVnF1MqxVyVZhmOlaKFlEa94pPGfWhX2qZy1ZqvVCc07hY
         5T0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3gI7bpdbWjmVG6mgR1rp7nZKPq7PDSoA3GLqSGZYdkA=;
        b=hh9Sg6ufjV5bjq/Oye4thdpEkO63jvlbKvdXtDHRk1/a1NbXNuDCylZ5MitpILKtBw
         h7kXMkZDtLbfdt2CDsMQ4zlJAY79hOV3P5gSOlRy3/dHSnagWfylL/asWOvG7aEq9rtp
         +/I6Reyf/fqw6fYKVEC29g02u2RW7iHhlY3kHZfIligKXdH7eKec/NOrMMpRCO0m1uZO
         9WMxxUNUNHSCe0FJjN5v40HI1f4yl9ah5/7+VW7US9RWZLIIje52m127Ay+Mtjz5yINu
         BaL/cjLS8EsUtmrkKtxGHl1lQy8tWV/dPGg3K6rG1M+b92irXDB3bN5IqKjm5mMqIVXy
         zFrQ==
X-Gm-Message-State: APjAAAU0C2ihwae0fQvr8GKv3IlZ+lv43lZr0+qpHTa7lWhuLeRxhUKH
        IZQ5ILfIEyIA4dtNsa+LGJpY5Wk2
X-Google-Smtp-Source: APXvYqz8a3LjZoNxpy0AmFGmEJ0mcc5vIDdvrn/ygsX+zrYVtBIsk9egNlEczOjyJs5Cml/+IbCy8g==
X-Received: by 2002:a62:8749:: with SMTP id i70mr31462301pfe.12.1570451516506;
        Mon, 07 Oct 2019 05:31:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w6sm17294232pfj.17.2019.10.07.05.31.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 05:31:55 -0700 (PDT)
Subject: Re: [PATCHv2] rtc: pcf2127: handle boot-enabled watchdog feature
To:     Bruno Thomsen <bruno.thomsen@gmail.com>
Cc:     =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20191003124849.117888-1-martin@geanix.com>
 <20191003133351.118538-1-martin@geanix.com>
 <CAH+2xPAtxcxd1xXuCmHc25X-Ai2_w-5rxZrgYbavjAzntMxX-Q@mail.gmail.com>
 <f741d1bd-bcde-d1e1-09b7-98bb6a30db33@roeck-us.net>
 <CC1D25DB-F95B-4110-809C-E8BE1493CDB7@geanix.com>
 <403595f7-99b4-142d-b4ff-7c574a3974fa@roeck-us.net>
 <CAH+2xPDkezVexmJRcuMmZ-vFbmw6CjDn3k4_SUNw_FNzy93AgQ@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <036e1e1d-1925-b003-8fb4-d568ae066d44@roeck-us.net>
Date:   Mon, 7 Oct 2019 05:31:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAH+2xPDkezVexmJRcuMmZ-vFbmw6CjDn3k4_SUNw_FNzy93AgQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 10/7/19 3:49 AM, Bruno Thomsen wrote:
> Hi Guenter & Martin
> 
> Den søn. 6. okt. 2019 kl. 18.19 skrev Guenter Roeck <linux@roeck-us.net>:
>>>>
>>>> This should not be decided on driver level. The intended means to
>>>> enforce
>>>> an initial timeout would be to set CONFIG_WATCHDOG_OPEN_TIMEOUT, or to
>>>> use
>>>> the open_timeout kernel parameter.
>>>
>>> That, and WATCHDOG_HANDLE_BOOT_ENABLED
>>>
>>
>> To clarify: If WATCHDOG_HANDLE_BOOT_ENABLED is disabled, the watchdog core
>> does not ping the watchdog on its own, and Bruno's argument does not apply
>> in the first place.
> 
> Thanks for clarifying.
> 
> When reading the WDOG_HW_RUNNING bit description in kernel api [1]
> documentation around line 247 you don't get the impression that the behavior
> can be modified by 2 Kconfig options and 1 runtime option. Maybe add an
> additional note?
> 

That is probably because the two configuration options were added later
and the documentation was not updated. Patches welcome.

Guenter

> I am overall okay with the change, but I have a few extra comments.
> 
> If the dev_err message is kept there is a typo in register name: wd_val.
> 
> The variable name wdd_timeout is a bit misleading as the register does not
> contain the initial timeout value but a countdown value, ex. wdd_value.
> 
> Bruno
> 
> [1] Documentation/watchdog/watchdog-kernel-api.rst
> 


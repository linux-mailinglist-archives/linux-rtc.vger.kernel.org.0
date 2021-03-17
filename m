Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEC1233ECFC
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Mar 2021 10:29:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbhCQJ26 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 17 Mar 2021 05:28:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhCQJ2y (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 17 Mar 2021 05:28:54 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 373A9C06174A;
        Wed, 17 Mar 2021 02:28:54 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id cl21-20020a17090af695b02900c61ac0f0e9so4990647pjb.1;
        Wed, 17 Mar 2021 02:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jq6hzi+Ykzrdd9FnU+Ty1LHbcLtlDYT1jRY6Uo10JfI=;
        b=ZMXn9l26DKzTWuPucxwVuR3puKtIwIHM6KUyc50ObvmGc4ZPjAjGAqgQzqAo7vudIu
         5RRi4NyxzYfuQogV+Ktpegq5j+M79rcZ1R+u+DQQwIu4ouPbY8QELeZj43DBepwOwx3H
         Ert08ovroTPih7bBepGtONlw4nRZKUnf/6zoHz5HehPoRrHHuVwci7wFEqjLTzggwlrZ
         Z/4/c3oEN4CGy3Rm83BlATjY/S6ZEaS8EHcbl0hgP4VNMYywJ66+CxTq9dEOvrdKe4RZ
         H+DbbnIbSinJ4E+sXmsdepctrE7ptnGAASbAxzq2imPLA3R5dlHvYqayYAzBwSwWBRUF
         Tf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jq6hzi+Ykzrdd9FnU+Ty1LHbcLtlDYT1jRY6Uo10JfI=;
        b=JTpD5x6YKEobvtNwWRQkbmsJjgzAesUVKnih9a3U6Ejew/3g1sO4GCrQ+JPATSfu6j
         HW/yX3B/C6D9TXS4L/BCr5abySFf//+N2B9zlqjhWyRKAcdznA5JPi9sZWDfacGzNPQr
         6WzduU5zJ0AcRGxntGTsrSE9Xa1nWFkuj742w++jTEBoMT7htTE1YIswQ2re5CqLeOPv
         WaxpO7DnBGHMZLhQ32u0wGMq8hq7TblHA0aJo5nKlPYFNGBEVd/Ok6Q2+xHFZ2KA9yfk
         kbzeM95nu2LGma2/3VyVmref+B/Yfg/sWzPg8YXFMIb6+YxM9Kpf2nZajkcY0nzPbqvq
         iD5A==
X-Gm-Message-State: AOAM531nqao13kk+2p4zAX061JoEzq6SPVMpgGAwiJ41vC8lLpLEQp4P
        8QVde77TzVjfuWPDwEfn9AXNaO5vUF5ew4b3yBk=
X-Google-Smtp-Source: ABdhPJyWEfmVDPk0vzNdD/vf0CvA/F1RKEHRLNCy7Bw6/NRtoRvP8k5NkUfYvxmaGHR+cPDnVSJSIcNEF+oI8/gOw80=
X-Received: by 2002:a17:902:a406:b029:e6:78c4:71c8 with SMTP id
 p6-20020a170902a406b02900e678c471c8mr3673250plq.17.1615973333693; Wed, 17 Mar
 2021 02:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210317075228.683184-1-ch@denx.de>
In-Reply-To: <20210317075228.683184-1-ch@denx.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 17 Mar 2021 11:28:37 +0200
Message-ID: <CAHp75VdRFqK6Tp+dFCHb_6ZBR32mNRLgyRKaMky43aoj1MOjcw@mail.gmail.com>
Subject: Re: [PATCH v5] rtc: rx6110: add ACPI bindings to I2C
To:     Claudius Heine <ch@denx.de>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Mar 17, 2021 at 9:56 AM Claudius Heine <ch@denx.de> wrote:
>
> From: Johannes Hahn <johannes-hahn@siemens.com>
>
> This allows the RX6110 driver to be automatically assigned to the right
> device on the I2C bus.

Thanks for an update!

> Signed-off-by: Johannes Hahn <johannes-hahn@siemens.com>
> Co-developed-by: Claudius Heine <ch@denx.de>
> Signed-off-by: Claudius Heine <ch@denx.de>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Reported-by: kernel test robot <lkp@intel.com>

This is usually for patches that do fix found problems, here it's a
completely new item and the report was done in the middle of the
development. That said, you may give credit to LKP by just mentioning
it in the comments section (after the cutter '---' line). I'll leave
this to Alexandre and Alessandro to decide if you need a resend or
they may remove it when applying. (In my opinion resend is not needed
right now)


> ---
>  drivers/rtc/rtc-rx6110.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/rtc/rtc-rx6110.c b/drivers/rtc/rtc-rx6110.c
> index 79161d4c6ce4..f4d425002f7f 100644
> --- a/drivers/rtc/rtc-rx6110.c
> +++ b/drivers/rtc/rtc-rx6110.c
> @@ -447,6 +447,12 @@ static int rx6110_i2c_probe(struct i2c_client *client,
>         return rx6110_probe(rx6110, &client->dev);
>  }
>
> +static const struct acpi_device_id rx6110_i2c_acpi_match[] = {
> +       { "SECC6110" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(acpi, rx6110_i2c_acpi_match);
> +
>  static const struct i2c_device_id rx6110_i2c_id[] = {
>         { "rx6110", 0 },
>         { }
> @@ -456,6 +462,7 @@ MODULE_DEVICE_TABLE(i2c, rx6110_i2c_id);
>  static struct i2c_driver rx6110_i2c_driver = {
>         .driver = {
>                 .name = RX6110_DRIVER_NAME,
> +               .acpi_match_table = rx6110_i2c_acpi_match,
>         },
>         .probe          = rx6110_i2c_probe,
>         .id_table       = rx6110_i2c_id,
>
> base-commit: 1df27313f50a57497c1faeb6a6ae4ca939c85a7d
> --
> 2.30.1
>


-- 
With Best Regards,
Andy Shevchenko

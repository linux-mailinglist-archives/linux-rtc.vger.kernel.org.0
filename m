Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B88F3CCFCC
	for <lists+linux-rtc@lfdr.de>; Sun,  6 Oct 2019 11:07:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726372AbfJFJHW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 6 Oct 2019 05:07:22 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:45093 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbfJFJHV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 6 Oct 2019 05:07:21 -0400
Received: by mail-ed1-f66.google.com with SMTP id h33so9664778edh.12;
        Sun, 06 Oct 2019 02:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LdLmw3jyu9VpLL7rNNOoIJG1aiZHneRVRzCW/lfPaZE=;
        b=CSzpzytaFsbzYH1PIqCUYlvwYCdvZVfevBS2bX2i7r7pGE/nhCdIndR+VRS66LHa/V
         cMvGGCf3uzS2EOB0C764z3q9cin8ozp5UZkOez/4dFngkZxaX6SCM/bRQuZtSOSCTWix
         QFcx9svyIiJIdCddKe7vhse+gP7jsa8guDWGQVkElq1VqiPmdy9uZdyfPzPIWVuuAMup
         Cz0+iSqTWY+CUBm3Bt/SIBqeZhJ9bdE3NkceaSOmeiNY40Uj4YF7JK4wm6qu+ew1k8hm
         eXlSbKlPBOGzkCvKi0hFja1eg65sh2qvvaE+pP/QlEcNecNldYzC2c4yKTgY7Kvg7R6K
         RmYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LdLmw3jyu9VpLL7rNNOoIJG1aiZHneRVRzCW/lfPaZE=;
        b=mk66wuI+VpfL9edjmgYHDNSe8Zk8LJ031T1mRaQJpZbZz6vfuOuGHqFt1v8nh+BA15
         ama2J3v8YqYTtx86nxCBu7aaKqkgraEH+1c2hUnfy7erFP6kEdRiu9nlS+MwuOFdOHBQ
         1aUZgQKdMfFbBhBDOXmADQyCMLyIC0WmREVZI3DGVFdtkYSFdWwkCwS93Fnew4LhXZQX
         0bYYrVkdUzBkymatcybeAz8uhGSTY1Fjvh9q936D453hvWoJ1Vb+1rxQ5lZYcQh0/alQ
         jtRy+dqvx+fz2FD91N7bgD6d1IW9MLAS+UiAPx3UJmrtn0K3IRMXmjQbnuE/yp+pQP9E
         7dzw==
X-Gm-Message-State: APjAAAXzpd67a6WbEwB2jLfeWDqkOOVbZp4uIV7jYhqMLvf8R3mcPGwE
        TvxhoQC5sQhj8xxlx/hv6t30FtK9JikfGa5TmG/9Mg==
X-Google-Smtp-Source: APXvYqxu7TIbKAQcHIe0HsB1B9NxDGUSu1ICwJMDCpt9K+IdcTqN7xxz3YkK/LkRXGk2QiJsaUl0ZCGnnT1+r2ecI58=
X-Received: by 2002:a50:ac0d:: with SMTP id v13mr23495378edc.189.1570352840015;
 Sun, 06 Oct 2019 02:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <20191003124849.117888-1-martin@geanix.com> <20191003133351.118538-1-martin@geanix.com>
In-Reply-To: <20191003133351.118538-1-martin@geanix.com>
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
Date:   Sun, 6 Oct 2019 11:07:03 +0200
Message-ID: <CAH+2xPAtxcxd1xXuCmHc25X-Ai2_w-5rxZrgYbavjAzntMxX-Q@mail.gmail.com>
Subject: Re: [PATCHv2] rtc: pcf2127: handle boot-enabled watchdog feature
To:     =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Martin,

Den tor. 3. okt. 2019 kl. 15.33 skrev Martin Hundeb=C3=B8ll <martin@geanix.=
com>:
>
> Linux should handle when the pcf2127 watchdog feature is enabled by the
> bootloader. This is done by checking the watchdog timer value during
> init, and set the WDOG_HW_RUNNING flag if the value differs from zero.
>
> Signed-off-by: Martin Hundeb=C3=B8ll <martin@geanix.com>
> ---
>
> Change since v1:
>  * remove setting of WDOG_HW_RUNNING in pcf2127_wdt_start()
>
>  drivers/rtc/rtc-pcf2127.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index cb3472f..4229915 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -420,6 +420,7 @@ static int pcf2127_probe(struct device *dev, struct r=
egmap *regmap,
>                         const char *name, bool has_nvmem)
>  {
>         struct pcf2127 *pcf2127;
> +       u32 wdd_timeout;
>         int ret =3D 0;
>
>         dev_dbg(dev, "%s\n", __func__);
> @@ -462,7 +463,6 @@ static int pcf2127_probe(struct device *dev, struct r=
egmap *regmap,
>         /*
>          * Watchdog timer enabled and reset pin /RST activated when timed=
 out.
>          * Select 1Hz clock source for watchdog timer.
> -        * Timer is not started until WD_VAL is loaded with a valid value=
.

Your patch does not change the fact that the watchdog timer is first
started after loading a
valid value into WD_VAL register. This driver can be used perfectly
fine without enabling the
watchdog feature from userspace. If someone chooses to reboot without
stopping the watchdog
it is of course expected to still run on next boot (e.g. device probe).

> +       /* Test if watchdog timer is started by bootloader */
> +       ret =3D regmap_read(pcf2127->regmap, PCF2127_REG_WD_VAL, &wdd_tim=
eout);
> +       if (ret) {
> +               dev_err(dev, "%s: watchdog value (wd_wal) failed\n", __fu=
nc__);
> +               return ret;
> +       }
> +
> +       if (wdd_timeout)
> +               set_bit(WDOG_HW_RUNNING, &pcf2127->wdd.status);
> +

I do not agree that this should be the default setting as
WDOG_HW_RUNNING bit causes
watchdog core to kick watchdog until userland takes over, e.g. you
have just broken the
chain-of-monitoring in the embedded Linux device:

Hardware watchdog -> systemd -> daemon(s) / application(s)

At this point in time you only know that u-boot / barebox can load and
start the kernel with
a device tree blob.

What if mounting of rootfs fails?
What if systemd fails to start?

When doing a reboot due to ex. firmware upgrade, systemd will keep
kicking the watchdog
until the last sec before restart handler is called and the hardware
watchdog should not be
touched before systemd is in control of the system again.

Bruno

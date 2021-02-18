Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC3831EBF9
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Feb 2021 17:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbhBRP75 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 18 Feb 2021 10:59:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233086AbhBRMge (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 18 Feb 2021 07:36:34 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 200AFC061788;
        Thu, 18 Feb 2021 04:35:54 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id do6so5285501ejc.3;
        Thu, 18 Feb 2021 04:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=t4SVuRKcikSaYMH4hIjPelECXJT6CpS2pg3slTGowks=;
        b=WGc6mJPUoEnaAjKoSGbbZB7Mo6/LLlrcF38Y/T6Aa0VSU7uUB3gu8qZ72s5FtfkyD3
         9vKt3muYb3al+dxDA/n6D3W9D04oDh5tFQifh/DiNqVilxeSWB6P2pOuhjLfB2cMg0nP
         UTPbNvZyEezg8DmvIUTZJPqTQB/yOU1tw/ND4OIsyzLRRc0ZqbsJMEPRQTEPIf7QV5NY
         vxqYxU5/0gzZOHHJVskYoKthrKM6AOoH7OUtQR5zMXWznkHngiiC/ldgt0hN1t8ah7/t
         PZQuPx8nc4PWKvtm6ZjgiUE+keop1PeDJC3/O/DIxK2AEDtcuxNH/riwPqHW5BnaSu+S
         SvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=t4SVuRKcikSaYMH4hIjPelECXJT6CpS2pg3slTGowks=;
        b=rCmNlt9Sx9bvlaFHENssPckvSxF6+K4gjNvpc7Ft+5qZ3FcebTRUIJxqyK0KTlJ5Dy
         ssG6VONswZ3vUb18JA35gANRUR1+EyjEVhgG2abaHOrcXQJVPeAzkia+wz04rM1hjm5J
         KmeqkBsAOZGE1xCYTQkBuc/NxdX9naF1h9XWqb1ZiACMU12kzRlMrx4i2BXQOr+bJQZ8
         DwRMoL7Me7XD5ex0ghXsKr8TSYTYxphcARZbfMkpUfXA/ORpnpRSi0JiixlBegNywgPR
         D05eT4Zrr67RkO+zVYAVOg5+XYbrr6wo0fexHQZBIEm3XDJGjfKLoUMLVzi02h/eUsZ+
         ARAQ==
X-Gm-Message-State: AOAM530VEZHzoUcX0Ued/q1LoQNXL4b4NpkcyliIw5EK/CssWY+IxzMV
        BgS6fQWkojHSPwaJQRY+mL/9X/EoAFdqjK93tfzAXlJtWEY=
X-Google-Smtp-Source: ABdhPJwZbk/NBE2euJ9iK6wtVcAYtf08q6TK50s66L9l5xmtlGfVx897E+V4ZCOeWBSK0Fo9XxdEB2lx3/afci8h8HI=
X-Received: by 2002:a17:906:1682:: with SMTP id s2mr3855566ejd.110.1613651752408;
 Thu, 18 Feb 2021 04:35:52 -0800 (PST)
MIME-Version: 1.0
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
Date:   Thu, 18 Feb 2021 13:35:36 +0100
Message-ID: <CAH+2xPDs8f=bR7y5QYCpYpJTE1KJPfuiML1og3S9TfSFtOFBHw@mail.gmail.com>
Subject: watchdog: pcf2127: systemd fails on 5.11
To:     linux-watchdog@vger.kernel.org, linux-rtc@vger.kernel.org
Cc:     open list <linux-kernel@vger.kernel.org>,
        Lars Alex Pedersen <laa@kamstrup.com>,
        Bruno Thomsen <bth@kamstrup.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

After updating the kernel from 5.8.17 to 5.11 systemd (246.6) is
unable to init watchdog in pcf2127 during boot. Kernel option
CONFIG_WATCHDOG_OPEN_TIMEOUT=300 is working as expected.
It's possible to get watchdog from userspace working in
the following 2 ways.
1) Disable watchdog in systemd and use busybox watchdog.
2) Restart systemd after boot with "kill 1".

During boot setting the system clock from RTC is working.
RTC read/write from userland with hwclock is also working.

DTS: imx7d-flex-concentrator-mfg.dts
SOC: NXP i.MX7D
Drivers: rtc-pcf2127, spi-imx
Communication: SPI

There are no patches applied to the kernel.

When systemd changes watchdog timeout it receives an
error that to our best knowledge comes from spi-imx[1].

We suspect it's a race condition between drivers or
incompatible error handling.

Any help in investigating the issue is appreciated.

/Bruno

[1] https://elixir.bootlin.com/linux/v5.11/source/drivers/spi/spi-imx.c#L1424

Relevant boot trace of pcf2127 and systemd:

Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0: pcf2127_probe
Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0:
pcf2127_rtc_read_time: raw data is cr3=08, sec=37, min=26, hr=09,
mday=18, wday=04, mon=02, year=21
Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0:
pcf2127_rtc_read_time: tm is secs=37, mins=26, hours=9, mday=18,
mon=1, year=121, wday=4
Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0: char device (252:0)
Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0: registered as rtc0
Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0:
pcf2127_rtc_read_time: raw data is cr3=08, sec=37, min=26, hr=09,
mday=18, wday=04, mon=02, year=21
Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0:
pcf2127_rtc_read_time: tm is secs=37, mins=26, hours=9, mday=18,
mon=1, year=121, wday=4
Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0: setting system
clock to 2021-02-18T09:26:37 UTC (1613640397)
Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0: I/O Error in PIO
Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0: SPI transfer failed: -110
Feb 18 09:26:46 tqma7 kernel: spi_master spi1: failed to transfer one
message from queue
Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0: I/O Error in PIO
Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0: SPI transfer failed: -110
Feb 18 09:26:46 tqma7 kernel: spi_master spi1: failed to transfer one
message from queue
Feb 18 09:26:46 tqma7 systemd[1]: Hardware watchdog 'NXP
PCF2127/PCF2129 Watchdog', version 0
Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0: new watchdog
timeout: 120s (old: 60s)
Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0: I/O Error in PIO
Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0: SPI transfer failed: -110
Feb 18 09:26:46 tqma7 kernel: spi_master spi1: failed to transfer one
message from queue
Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0:
pcf2127_wdt_active_ping: watchdog restart failed, ret=-110
Feb 18 09:26:46 tqma7 systemd[1]: Failed to set timeout to 120s:
Connection timed out


Relevant trace after systemd restart (kill 1):

Feb 02 10:42:39 tqma7 kernel: watchdog: watchdog0: nowayout prevents
watchdog being stopped!
Feb 02 10:42:39 tqma7 kernel: watchdog: watchdog0: nowayout prevents
watchdog being stopped!
Feb 02 10:42:39 tqma7 kernel: watchdog: watchdog0: watchdog did not stop!
Feb 02 10:42:39 tqma7 systemd[1]: systemd 246.6 running in system
mode. (-PAM -AUDIT -SELINUX -IMA -APPARMOR -SMACK -SYSVINIT -UTMP
-LIBCRYPTSETUP -GCRYPT -GNUTLS -ACL +XZ -LZ4 +ZSTD +SECCOMP +BLKID
+ELFUTILS +KMOD -IDN2 -IDN -PCRE2 default-hierarchy=unified)
Feb 02 10:42:39 tqma7 systemd[1]: Detected architecture arm.
Feb 02 10:42:40 tqma7 systemd[1]: Hardware watchdog 'NXP
PCF2127/PCF2129 Watchdog', version 0
Feb 02 10:42:40 tqma7 kernel: rtc-pcf2127-spi spi1.0: new watchdog
timeout: 30s (old: 30s)
Feb 02 10:42:40 tqma7 systemd[1]: Set hardware watchdog to 30s.

Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE72332224F
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Feb 2021 23:44:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232072AbhBVWoe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 Feb 2021 17:44:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230483AbhBVWoK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 22 Feb 2021 17:44:10 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD9C3C06174A;
        Mon, 22 Feb 2021 14:43:27 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id s107so13692479otb.8;
        Mon, 22 Feb 2021 14:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HiONxAwJhNLIjwGdUzalnPiDVstUCUPoTFFEupHZEV0=;
        b=i/6PbOhIPSlYOaGXWmmf+12j6vV2o7VueuVJreRV1gUAQ0pC7Z5rnCyTK5noi6tLS5
         8HooFKqEtZ0EqnqVct9Gd2JO26oift7ZJp1Gff49cSWykp96To4G2S2oglE6p5Pae8rv
         V1vUmUgzXnpwSlDWsToJgoOaOntatfua9qGGKF9mQrOtL9KzaWkKLvB9UHFgztQS9UFn
         ZZro2pJ1zfFh+fSSmPd4iVUrSP4JYMxxWm0EDCiS8ngNbe450xoSwdMK3pmlAw5Y3Lm9
         FTTxj6sT/ocks7qe9MW5nuVsrc3htsW2je2WVgkwTJUQCH4TEBgdGXCC+r7tBoG+CrUC
         8eHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=HiONxAwJhNLIjwGdUzalnPiDVstUCUPoTFFEupHZEV0=;
        b=Xff7kVvqrXicVJikK0RF5bz97b59v0Rv5nWBYYic+f/F4oxUpVRrzCUbNVcsk/5ZsL
         SBP8YQw49jYaQMVit6LkaZAtkLeRHRbErGsvXzN92dZRjCYRHMdBRynLxPFF9rP4ZICw
         IWs5EaPV2NnnC1AwsO72Ey//jt/eqwGnI6tv295Z52ard5XnRQg/bZ3gQOOzDVMLLoS7
         MyXAR1RjRqtsRpAArd4075NGuExfHXM2MUnAF2jGI1gO+5WVIy+70u8PfIG/f1sRBIe4
         J3AdK/9jZtdE6tK4VE/iTVyoD3OPfQrftEciB71OvlH7qhIhVPlndsTwOjgRWANpAN/i
         2rYA==
X-Gm-Message-State: AOAM533TYSh+HQTJLfcAv85+0zPHe2V8Aw+jrbTMXuI/Ku1wAYrd+Lo+
        mRCv0zyipxOrQWVRSmZ/9//u+KJ/lRE=
X-Google-Smtp-Source: ABdhPJyTwYpDMuYDpmPyg5LTFTSUfsLCpMuuyBWVo+9syQcE8M0gA9aTP00w7VqO7yv4bRBPKlKRzA==
X-Received: by 2002:a05:6830:2017:: with SMTP id e23mr18958760otp.197.1614033807210;
        Mon, 22 Feb 2021 14:43:27 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l202sm1749471oib.16.2021.02.22.14.43.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Feb 2021 14:43:26 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 22 Feb 2021 14:43:25 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Bruno Thomsen <bruno.thomsen@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, linux-rtc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Lars Alex Pedersen <laa@kamstrup.com>,
        Bruno Thomsen <bth@kamstrup.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: watchdog: pcf2127: systemd fails on 5.11
Message-ID: <20210222224325.GB177866@roeck-us.net>
References: <CAH+2xPDs8f=bR7y5QYCpYpJTE1KJPfuiML1og3S9TfSFtOFBHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH+2xPDs8f=bR7y5QYCpYpJTE1KJPfuiML1og3S9TfSFtOFBHw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Feb 18, 2021 at 01:35:36PM +0100, Bruno Thomsen wrote:
> Hi,
> 
> After updating the kernel from 5.8.17 to 5.11 systemd (246.6) is
> unable to init watchdog in pcf2127 during boot. Kernel option
> CONFIG_WATCHDOG_OPEN_TIMEOUT=300 is working as expected.
> It's possible to get watchdog from userspace working in
> the following 2 ways.
> 1) Disable watchdog in systemd and use busybox watchdog.
> 2) Restart systemd after boot with "kill 1".
> 
> During boot setting the system clock from RTC is working.
> RTC read/write from userland with hwclock is also working.
> 
> DTS: imx7d-flex-concentrator-mfg.dts
> SOC: NXP i.MX7D
> Drivers: rtc-pcf2127, spi-imx
> Communication: SPI
> 
> There are no patches applied to the kernel.
> 
> When systemd changes watchdog timeout it receives an
> error that to our best knowledge comes from spi-imx[1].
> 
> We suspect it's a race condition between drivers or
> incompatible error handling.
> 
> Any help in investigating the issue is appreciated.
> 
Difficult to say without access to hardware. The code does have a
potential problem, though: It calls pcf2127_wdt_ping not only from
watchdog code but also from various rtc related functions, but there
is not access protection. This is even more concerning because the ping
function is called from an interrupt handler.  At the same time, the
watchdog initialization sets min_hw_heartbeat_ms to 500, which suggests
that there may be a minimum time between heartbeats (which is clearly
violated by the current code).

Guenter

> /Bruno
> 
> [1] https://elixir.bootlin.com/linux/v5.11/source/drivers/spi/spi-imx.c#L1424
> 
> Relevant boot trace of pcf2127 and systemd:
> 
> Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0: pcf2127_probe
> Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0:
> pcf2127_rtc_read_time: raw data is cr3=08, sec=37, min=26, hr=09,
> mday=18, wday=04, mon=02, year=21
> Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0:
> pcf2127_rtc_read_time: tm is secs=37, mins=26, hours=9, mday=18,
> mon=1, year=121, wday=4
> Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0: char device (252:0)
> Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0: registered as rtc0
> Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0:
> pcf2127_rtc_read_time: raw data is cr3=08, sec=37, min=26, hr=09,
> mday=18, wday=04, mon=02, year=21
> Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0:
> pcf2127_rtc_read_time: tm is secs=37, mins=26, hours=9, mday=18,
> mon=1, year=121, wday=4
> Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0: setting system
> clock to 2021-02-18T09:26:37 UTC (1613640397)
> Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0: I/O Error in PIO
> Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0: SPI transfer failed: -110
> Feb 18 09:26:46 tqma7 kernel: spi_master spi1: failed to transfer one
> message from queue
> Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0: I/O Error in PIO
> Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0: SPI transfer failed: -110
> Feb 18 09:26:46 tqma7 kernel: spi_master spi1: failed to transfer one
> message from queue
> Feb 18 09:26:46 tqma7 systemd[1]: Hardware watchdog 'NXP
> PCF2127/PCF2129 Watchdog', version 0
> Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0: new watchdog
> timeout: 120s (old: 60s)
> Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0: I/O Error in PIO
> Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0: SPI transfer failed: -110
> Feb 18 09:26:46 tqma7 kernel: spi_master spi1: failed to transfer one
> message from queue
> Feb 18 09:26:46 tqma7 kernel: rtc-pcf2127-spi spi1.0:
> pcf2127_wdt_active_ping: watchdog restart failed, ret=-110
> Feb 18 09:26:46 tqma7 systemd[1]: Failed to set timeout to 120s:
> Connection timed out
> 
> 
> Relevant trace after systemd restart (kill 1):
> 
> Feb 02 10:42:39 tqma7 kernel: watchdog: watchdog0: nowayout prevents
> watchdog being stopped!
> Feb 02 10:42:39 tqma7 kernel: watchdog: watchdog0: nowayout prevents
> watchdog being stopped!
> Feb 02 10:42:39 tqma7 kernel: watchdog: watchdog0: watchdog did not stop!
> Feb 02 10:42:39 tqma7 systemd[1]: systemd 246.6 running in system
> mode. (-PAM -AUDIT -SELINUX -IMA -APPARMOR -SMACK -SYSVINIT -UTMP
> -LIBCRYPTSETUP -GCRYPT -GNUTLS -ACL +XZ -LZ4 +ZSTD +SECCOMP +BLKID
> +ELFUTILS +KMOD -IDN2 -IDN -PCRE2 default-hierarchy=unified)
> Feb 02 10:42:39 tqma7 systemd[1]: Detected architecture arm.
> Feb 02 10:42:40 tqma7 systemd[1]: Hardware watchdog 'NXP
> PCF2127/PCF2129 Watchdog', version 0
> Feb 02 10:42:40 tqma7 kernel: rtc-pcf2127-spi spi1.0: new watchdog
> timeout: 30s (old: 30s)
> Feb 02 10:42:40 tqma7 systemd[1]: Set hardware watchdog to 30s.

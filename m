Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D75B10CC72
	for <lists+linux-rtc@lfdr.de>; Thu, 28 Nov 2019 17:04:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbfK1QEW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 28 Nov 2019 11:04:22 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:45060 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbfK1QEW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 28 Nov 2019 11:04:22 -0500
Received: by mail-qk1-f194.google.com with SMTP id x1so8391479qkl.12
        for <linux-rtc@vger.kernel.org>; Thu, 28 Nov 2019 08:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=J1Wqf15Iqmyuyh56cgyHRZJp3Hgujck0x+MYQFJQgzY=;
        b=pv9651yDY5NzgOVa9fKXkrrZTF43xkgIiLfyTkzQS7M6kj6RZjxPfWHbsMZMNmQ0O8
         EaMICdIW3ZUwq/ykyNPwdwlh3vh+YXaMyc2rgi0Na2tB0g4deWPeOPsUlHU0tsAjB+z3
         Zl7/ow5DhXpzQ9pipHj34+MRahTdgCvc1TmeqoFfv/LRl4IP4FFP4dWYxEm12qRkOyZH
         o/FwOX4qluejk6YSBstwR13syMRmmposewQouoJyAgwAy1VJ66CKoZgSluHIyYzKgy1F
         26oJq/emsw8tUtIe54u50pI5nI62kPkURcL+31o/JC8yeRvPlNRsg2MUhKBObMVjmgSp
         aYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=J1Wqf15Iqmyuyh56cgyHRZJp3Hgujck0x+MYQFJQgzY=;
        b=l2ixRX2IVXQJYzVZKKd2iU3BHO4ZodzrABfWZtLjQFE/az1NgRtR+gQfhon5NhrQ89
         YDAWAvrYYAabvMkz5jr4WK7bTCIVjsM9mdl1JD+gOt1reIPTcaVoHp6YHQzV8BVW+XIz
         HtlL5rISp1DZ/0aK8/dEhK9SES/5x5oPZ5cpbgyyz+SI3PNshViP6xxksllATCQqKmMf
         lEIpgbwAb8fXfmZJoN9wUatpc0cuVzmqa5y7RMuyNkLz3mEBL+64eFdwJ8Sx4fJdvXYD
         bGAQo0lBMZ/Gp3z3V7101BfYi3JI4U4YGuQ7h/4dR1o3XU7sUaJ32CqyzZeknNApWXJI
         YSsw==
X-Gm-Message-State: APjAAAVjmhaEXp7+Qh1VHyekNiPhDu7KnYIkc7arVpPIFuWB+g7dcsKd
        5er1L9t5SkThMTYpjeCXsjODBoNRkGk6MA==
X-Google-Smtp-Source: APXvYqzDRfMXeBD33YSmCQTcR3ARztThKKh11dXmadFlHuBNGtABcdLm6byLC25lHq0K+Ibm4B2FNg==
X-Received: by 2002:ae9:e704:: with SMTP id m4mr10672281qka.153.1574957060775;
        Thu, 28 Nov 2019 08:04:20 -0800 (PST)
Received: from jfdmac.sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.gmail.com with ESMTPSA id o70sm8763985qke.47.2019.11.28.08.04.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Nov 2019 08:04:20 -0800 (PST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH 2/2] rtc: zynqmp: fix invalid read_time before 1 second
From:   Jean-Francois Dagenais <jeff.dagenais@gmail.com>
In-Reply-To: <ca78b7e6-a0c3-745b-1533-6b8424d97623@xilinx.com>
Date:   Thu, 28 Nov 2019 11:04:19 -0500
Cc:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        Srinivas Goud <sgoud@xilinx.com>, git@xilinx.com,
        linux-rtc@vger.kernel.org, champagne.guillaume.c@gmail.com,
        =?utf-8?Q?Maxime_Roussin-B=C3=A9langer?= 
        <maxime.roussinbelanger@gmail.com>,
        Mathieu Gallichand <Mathieu.Gallichand@Sonatest.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <CD70064B-5087-4A0F-9197-1F4A3DAA8B50@gmail.com>
References: <20191128015613.10003-1-jeff.dagenais@gmail.com>
 <20191128015613.10003-2-jeff.dagenais@gmail.com>
 <ca78b7e6-a0c3-745b-1533-6b8424d97623@xilinx.com>
To:     Michal Simek <michal.simek@xilinx.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Michal, all,

> On Nov 28, 2019, at 03:19, Michal Simek <michal.simek@xilinx.com> =
wrote:
>=20
>> in CURRENT_TIME and proceeds to use SET_TIME_READ (RTC_SET_TM_RD in =
the
>> code). This register contains garbage at this moment and this is
>> returned as the current time.
>=20
> How did you test this?

Remember the linux trampoline code... jumping from FSBL to the kernel =
without
u-boot? Well, got it working and it speeds our boot substantially. This =
means we
now reach rtc-zynqmp.c's probe within one second of power on. When we =
boot the
board without a psbatt, and no internet connection (which means
systemd-timesyncd cannot fix the bunkers date), we were ending up with a =
date in
the very distant future (>50 years into the future). Aside from the date =
in our
UI, all our SSL connections were failing because of certificate dates. =
This got
our attention.

We drilled down quite a lot to find the real root cause. We used JTAG =
with xsct
with our board simply powered on but not booted (bootselect SD without =
an SD
card). This means no FSBL/psu_init code has run.

Exhibit A:

xsct% rrd rtc
     set_time_write                  set_time_read: 00000000
        calib_write                     calib_read: 00000000
       current_time: 00000000                alarm: 00000000
     rtc_int_status:       00         rtc_int_mask:       03
         rtc_int_en                    rtc_int_dis
         addr_error:       00  addr_error_int_mask:       01
  addr_error_int_en             addr_error_int_dis
            control: 01000000           safety_chk: 00000000


Then we enable the RTC:

xsct% rwr rtc control 0x81000000

The counter now counts, set_time_read and calib_read are garbage:
xsct% rrd rtc
     set_time_write                  set_time_read: fffe6bff
        calib_write                     calib_read: 000f7fff
       current_time: 00000002                alarm: 00000000
     rtc_int_status:       01         rtc_int_mask:       03
         rtc_int_en                    rtc_int_dis
         addr_error:       00  addr_error_int_mask:       01
  addr_error_int_en             addr_error_int_dis
            control: 81000000           safety_chk: 00000000
xsct% rrd rtc
     set_time_write                  set_time_read: fffe6bff
        calib_write                     calib_read: 000f7fff
       current_time: 00000005                alarm: 00000000
     rtc_int_status:       01         rtc_int_mask:       03
         rtc_int_en                    rtc_int_dis
         addr_error:       00  addr_error_int_mask:       01
  addr_error_int_en             addr_error_int_dis
            control: 81000000           safety_chk: 00000000
xsct% rrd rtc
     set_time_write                  set_time_read: fffe6bff
        calib_write                     calib_read: 000f7fff
       current_time: 00000008                alarm: 00000000
     rtc_int_status:       01         rtc_int_mask:       03
         rtc_int_en                    rtc_int_dis
         addr_error:       00  addr_error_int_mask:       01
  addr_error_int_en             addr_error_int_dis
            control: 81000000           safety_chk: 00000000

We tested further, inserted a psbatt, enabled the RTC, but never touched
set_time_write. Powered our board on and off. The observations is that =
that
set_time_read and calib_read registers are not initialized to 0x0 upon =
power on.
Once set though, they keep their values as long as the system is powered =
on or
psbatt keeps the RTC alive. This is a contradiction of the register POR =
values
specification.

So for rtc-zynqmp.c, it means that using the set_time_read register is a =
bad
idea unless the code can definitely say that the set_time_write has been =
written
to. And this is exactly what our patch does, by use of the seconds =
interrupt
being enabled which signals the read_time() function that there is a =
pending
write, and therefore the set_time_read can reliably be read.

Hope this helps!


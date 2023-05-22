Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9D7F70C16A
	for <lists+linux-rtc@lfdr.de>; Mon, 22 May 2023 16:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233617AbjEVOqv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 May 2023 10:46:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbjEVOqv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 22 May 2023 10:46:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A89599
        for <linux-rtc@vger.kernel.org>; Mon, 22 May 2023 07:46:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DC24B622D5
        for <linux-rtc@vger.kernel.org>; Mon, 22 May 2023 14:46:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A863C433EF;
        Mon, 22 May 2023 14:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684766809;
        bh=vhuIRrDT8X9cmo3+5XIh/SHkWG/f+SP++78rC5pbsrk=;
        h=Date:From:To:Cc:Subject:From;
        b=jmx1AeaYX6OCpAR8lMmhL+nuFWFRAZ8HZfqZD8tUnJ9nVc92g2Nmnzyktw/lBoZv6
         4987INZy30EP7WySXWzVH1JTe4CFSYeeuDUgO79C09x4+Pe8mAaR5b1zB0vMCyb29I
         JrY62vS5Q/wBBxkWQD7eaDqWDkQb7QexQe/CkARM4fnVVK/gA2zF7UMTYDawmQoAfw
         vrt/BQqw5T8y+GXWHFvIu0P1GNV8O1x8gyWnbaULFLJVsqveKn7BAIJwqLt4lznjgz
         TtVs7UDLCFWU6AcBs8cCEIjk7cxX99AWy4zcxAGlD3qPPM9T3JS51dTFXV53hOJPVU
         SjSOfvgPJYLkw==
Date:   Mon, 22 May 2023 16:46:38 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     linux-rtc@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: question about firmware RTC design (for rtcwake)
Message-ID: <20230522164638.68fea327@thinkpad>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello RTC guys,

this is a request for suggestions / question about how to implement a
RTC driver so that it will be accepted into upstream Linux.

Let me start with the description of the problem.

The MCU on the Turris Omnia router can disable / enable power
regulators basically for the whole board, giving capability for
platform specific poweroff and for powering the system on at a
specified time.

I want to add support for this to the MCU firmware and write a driver
for Linux. Since I know only of one utility by which users can request
the system to power on at a specified time - the rtcwake utility - I
want to write this as a RTC driver.

Because the MCU is not a true RTC in the sense that it does not have
battery to count time when not under power, I am wondering how exactly
to design this. One problem is that the RTC driver must implement the
read function, but the MCU does not know the real time unless it is
told beforehand.

Note that the board also has a true RTC with battery, handled by the
rtc-armada38x driver. We can make sure that this true RTC is used for
hctosys.

Proposal 1:
- the MCU will implement only one command, poweroff, with optional
  argument wakeup_timeout, the number of seconds after which to power
  the board up again
- the corresponding driver will register a system off handler and a RTC
  device
- the RTC will implement methods as:
    .read_time   will use ktime_get(), so it will return monotonic clock
    .set_alarm   will store the requested wakeup time in an internal
                 structure
    .alarm_irq_enable   will just update the internal structure
    .read_alarm  will return information from the stored structure
- the system off handler will send the poweroff command and it will
  take the requested wakeup time from the internal structure and
  subtract current time (ktime_get()) to get the wakeup_timeout
  argument for the MCU poweroff command

- advantages:
  - MCU needs only to implement one command
- disadvantages:
  - the new RTC device will not behave at all like a rtc device
    regarding timekeeping, since .read_time returns system's monotonic
    clock. This may confuse users who do not know about the fact that
    this rtc device is only meant for rtcwake. We can print this info
    into dmesg, but...
  - removing the driver and loading it back loses information about set
    wakeup time

Proposal 2:
- the MCU will implement:
  - command for getting and setting clock that the MCU will count
    The clock will be considered invalid unless it was set at least
    once.
  - command for getting and setting wakeup alarm
  - command for power off
- the corresponding driver will again register a system off handler and
  a RTC device
- the system off handler will just send the poweroff command
- the RTC device can now behave like a true RTC device, but without a
  battery, the RTC_VL_BACKUP_EMPTY bit will be set.
  The userspace can set time from the true RTC, so that rtcwake may be
  used

Overall proposal 1 is easier to implement, but the resulting /dev/rtc
device will not be a true RTC, which may confuse users. Proposal 2
gives more complexity to MCU firmware.

Personally I prefer proposal one.

Do you guys have suggestions? Which kind of driver would you be willing
to accept?

Note that the driver will probably live under drivers/mfd or
drivers/platform, since the MCU implements other features, as well (a
GPIO controller, for example).

Marek

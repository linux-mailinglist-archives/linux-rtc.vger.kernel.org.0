Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 346E042CABD
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Oct 2021 22:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbhJMUQc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 13 Oct 2021 16:16:32 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:44507 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239144AbhJMUQb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 13 Oct 2021 16:16:31 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 534FF100003;
        Wed, 13 Oct 2021 20:14:26 +0000 (UTC)
Date:   Wed, 13 Oct 2021 22:14:26 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Phil Elwell <phil@raspberrypi.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org
Subject: Re: Question about PCF85063A invalid state
Message-ID: <YWc+IghMxa4oCcK9@piout.net>
References: <3c6e4252-8271-c968-0bf9-83a23384ce01@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c6e4252-8271-c968-0bf9-83a23384ce01@raspberrypi.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

On 13/10/2021 10:48:48+0100, Phil Elwell wrote:
> Hi,
> 
> We're using the PCF85063A on our Compute Module 4 I/O board, and a number of
> users have experienced problems with invalid state after inserting a backup
> battery. So far the problem has been confined to EXT_TEST (bit 7 of CTRL_1)
> being set, but there are a number of registers for which the driver only
> modifies a subset of the bits.
> 
> I can think of a number of ways to clear this invalid state, none of which
> are difficult - force a software reset whenever certain bits of certain
> registers have certain values, always specifically force some bits to known
> values, etc. -
> but are there any preferences or pitfalls to be aware of?
> 

This is a very difficult topic because contrary to most of the other
IPs, the RTC is still running while Linux is not and it is expected that
it will retain its configuration across reboots (well, this is exactly
what the RTC is for).

This means that you may have some code (bootloader, firmware) running
before Linux configuring the RTC and so setting or clearing bits in
registers that are never touched by Linux. So, it is not possible to go
and change random bits because they don't have the default value or the
value we expect. Instead it is usually necessary to provide a way to
set those bits.

However, for EXT_TEST, I would assume the RTC lost its time once it is
set so I would treat it just like OS: if it is set, then leave it that
way until .set_time is called and return -EINVAL in .read_time.

I didn't try but if OS is always set by the RTC when EXT_TEST is set,
then maybe we don't need to check in .read_time.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

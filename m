Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 275443EF526
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Aug 2021 23:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235345AbhHQVqQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Aug 2021 17:46:16 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:53537 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235230AbhHQVqP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 Aug 2021 17:46:15 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 15EEE240002;
        Tue, 17 Aug 2021 21:45:40 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        linux-rtc@vger.kernel.org
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCH] rtc-cmos: remove stale REVISIT comments
Date:   Tue, 17 Aug 2021 23:45:39 +0200
Message-Id: <162923673250.529201.18056517029985400844.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210716210437.29622-1-mat.jonczyk@o2.pl>
References: <20210716210437.29622-1-mat.jonczyk@o2.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 16 Jul 2021 23:04:37 +0200, Mateusz Jończyk wrote:
> It appears mc146818_get_time() and mc146818_set_time() now correctly
> use the century register as specified in the ACPI FADT table. It is not
> clear what else could be done here.
> 
> These comments were introduced by
>         commit 7be2c7c96aff ("[PATCH] RTC framework driver for CMOS RTCs")
> in 2007, which originally referenced function get_rtc_time() in
> include/asm-generic/rtc.h .
> 
> [...]

Applied, thanks!

[1/1] rtc-cmos: remove stale REVISIT comments
      commit: e1aba37569f0aa9c993f740828871e48eea79f98

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

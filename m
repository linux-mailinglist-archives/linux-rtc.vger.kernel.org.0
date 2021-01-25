Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 303ED303025
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Jan 2021 00:30:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732742AbhAYXaM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 25 Jan 2021 18:30:12 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:48697 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732875AbhAYX3V (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 25 Jan 2021 18:29:21 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0C5BE20003;
        Mon, 25 Jan 2021 23:28:21 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     a.zummo@towertech.it,
        Philipp Rosenberger <p.rosenberger@kunbus.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        dan.carpenter@oracle.com, bruno.thomsen@gmail.com,
        u.kleine-koenig@pengutronix.de, biwen.li@nxp.com,
        linux-kernel@vger.kernel.org, l.sanfilippo@kunbus.com,
        linux-rtc@vger.kernel.org, lvb@xiphos.com
Subject: Re: [PATCH v3 0/2] rtc: pcf2127: proper initialization after power loss
Date:   Tue, 26 Jan 2021 00:28:21 +0100
Message-Id: <161161723905.1969074.4659584824562876901.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118085752.5759-1-p.rosenberger@kunbus.com>
References: <20210118085752.5759-1-p.rosenberger@kunbus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 18 Jan 2021 09:57:50 +0100, Philipp Rosenberger wrote:
> If the PCF2127/2129 loses power it needs some initialization to work
> correctly. A bootloader/firmware might do this. If not we should do this
> in the driver.
> 
> Changes for v3:
> - drop the test if clearing PORO was successful
> - only run OTP refresh if OTPR bit is not already set
> 
> [...]

Applied, thanks!

[1/2] rtc: pcf2127: Disable Power-On Reset Override
      commit: b9ac079abefc1f1cbee8a0f7195bad1d32dc72c7
[2/2] rtc: pcf2127: Run a OTP refresh if not done before
      commit: 15f57b3e3130790b6d06ea04f0c1edf0e5455bdd

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

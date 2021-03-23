Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C618346B0A
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Mar 2021 22:26:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233502AbhCWV0G (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 23 Mar 2021 17:26:06 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:38081 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233465AbhCWV0D (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 23 Mar 2021 17:26:03 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id ED443E0002;
        Tue, 23 Mar 2021 21:26:00 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Claudius Heine <ch@denx.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        open list <linux-kernel@vger.kernel.org>,
        johannes hahn <johannes-hahn@siemens.com>,
        "open list:REAL TIME CLOCK RTC SUBSYSTEM" <linux-rtc@vger.kernel.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        werner zeh <werner.zeh@siemens.com>,
        henning schild <henning.schild@siemens.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        martin mantel <martin.mantel@siemens.com>,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5] rtc: rx6110: add ACPI bindings to I2C
Date:   Tue, 23 Mar 2021 22:26:00 +0100
Message-Id: <161653466861.364787.16418008059255662385.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317075228.683184-1-ch@denx.de>
References: <20210317075228.683184-1-ch@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 17 Mar 2021 08:52:27 +0100, Claudius Heine wrote:
> This allows the RX6110 driver to be automatically assigned to the right
> device on the I2C bus.

Applied, thanks!

[1/1] rtc: rx6110: add ACPI bindings to I2C
      commit: 8d69f62fddf6c1a8c7745120c4d6aab9322b001a

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

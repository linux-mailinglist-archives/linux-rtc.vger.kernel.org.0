Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90BB93EF525
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Aug 2021 23:45:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235274AbhHQVqP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Aug 2021 17:46:15 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:40089 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbhHQVqP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 Aug 2021 17:46:15 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 4C31E20003;
        Tue, 17 Aug 2021 21:45:40 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Anton Bambura <jenneron@protonmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v1] rtc: tps65910: Correct driver module alias
Date:   Tue, 17 Aug 2021 23:45:38 +0200
Message-Id: <162923673249.529201.12931299534359850420.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210808160030.8556-1-digetx@gmail.com>
References: <20210808160030.8556-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, 8 Aug 2021 19:00:30 +0300, Dmitry Osipenko wrote:
> The TPS65910 RTC driver module doesn't auto-load because of the wrong
> module alias that doesn't match the device name, fix it.
> 
> 
> 
> 

Applied, thanks!

[1/1] rtc: tps65910: Correct driver module alias
      commit: 8d448fa0a8bb1c8d94eef7647edffe9ac81a281e

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

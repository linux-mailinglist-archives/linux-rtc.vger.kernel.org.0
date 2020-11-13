Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF40A2B179A
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Nov 2020 09:56:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbgKMI4g (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 13 Nov 2020 03:56:36 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44084 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726160AbgKMI4f (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 13 Nov 2020 03:56:35 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id B89A21F4680B
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
To:     Benson Leung <bleung@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     kernel@collabora.com, Alessandro Zummo <a.zummo@towertech.it>,
        Guenter Roeck <groeck@chromium.org>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] platform/chrome: Don't treat RTC events as wakeup sources
Date:   Fri, 13 Nov 2020 09:56:25 +0100
Message-Id: <160521341449.487210.11292541473208275402.b4-ty@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201030232523.2654478-1-swboyd@chromium.org>
References: <20201030232523.2654478-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 30 Oct 2020 16:25:23 -0700, Stephen Boyd wrote:
> The EC sends an RTC host event when the RTC fires, but we don't need to
> treat that as a wakeup event here. The RTC class already properly
> handles activating and deactivating a wakeup source in rtc_update_irq()
> by calling pm_stay_awake() at the start of processing and pm_relax()
> once all expired RTC timers have been processed. This reduces one wakeup
> increment but not much else. I noticed this while debugging RTC wakeups
> and how they always incremented the wakeup count by two instead of one
> because this is duplicated.

Applied, thanks!

[1/1] platform/chrome: Don't treat RTC events as wakeup sources
      commit: 853c1a789f5fe8e783586a5c2dcc2ad1b57ac20f

Best regards,
-- 
Enric Balletbo i Serra <enric.balletbo@collabora.com>

Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08C1A42FBC4
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Oct 2021 21:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242586AbhJOTOd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 15 Oct 2021 15:14:33 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:57597 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234151AbhJOTOc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 15 Oct 2021 15:14:32 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 19E7A60009;
        Fri, 15 Oct 2021 19:12:25 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Phil Elwell <phil@raspberrypi.com>, linux-rtc@vger.kernel.org
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] rtc: pcf85063: Always clear EXT_TEST from set_time
Date:   Fri, 15 Oct 2021 21:12:20 +0200
Message-Id: <163432513382.815620.1409724606768389621.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211015111208.1757110-1-phil@raspberrypi.com>
References: <20211015111208.1757110-1-phil@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 15 Oct 2021 12:12:08 +0100, Phil Elwell wrote:
> Power-on reset after the insertion of a battery does not always complete
> successfully, leading to corrupted register content. The EXT_TEST bit
> will stop the clock from running, but currently the driver will never
> recover.
> 
> Safely handle the erroneous state by clearing EXT_TEST as part of the
> usual set_time method.
> 
> [...]

Applied, thanks!

[1/1] rtc: pcf85063: Always clear EXT_TEST from set_time
      commit: 9f08c9ed580a287de6546044e28f15bb183d00ff

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

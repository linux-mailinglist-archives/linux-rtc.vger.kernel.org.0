Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3504D3AE030
	for <lists+linux-rtc@lfdr.de>; Sun, 20 Jun 2021 22:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbhFTUWw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 20 Jun 2021 16:22:52 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:60885 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbhFTUWv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 20 Jun 2021 16:22:51 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 833E720005;
        Sun, 20 Jun 2021 20:20:36 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yang Yingliang <yangyingliang@huawei.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        a.zummo@towertech.it
Subject: Re: [PATCH -next] rtc: sysfs: Correct function name hctosys_show()
Date:   Sun, 20 Jun 2021 22:20:34 +0200
Message-Id: <162422042125.1087482.12186269568617545106.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517045901.3461800-1-yangyingliang@huawei.com>
References: <20210517045901.3461800-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 17 May 2021 12:59:01 +0800, Yang Yingliang wrote:
> Fix the following make W=1 kernel build warning:
> 
>   drivers/rtc/sysfs.c:115: warning: expecting prototype for rtc_sysfs_show_hctosys(). Prototype was for hctosys_show() instead

Applied, thanks!

[1/1] rtc: sysfs: Correct function name hctosys_show()
      commit: a8fdbefd75f660b471112d7d0bf583adf78f5c34

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

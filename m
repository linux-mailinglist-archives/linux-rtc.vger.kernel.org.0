Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC6C31AE29
	for <lists+linux-rtc@lfdr.de>; Sat, 13 Feb 2021 22:42:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbhBMVlw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 13 Feb 2021 16:41:52 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:15769 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbhBMVlv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 13 Feb 2021 16:41:51 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C2B17240003;
        Sat, 13 Feb 2021 21:41:03 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     aisheng.dong@nxp.com, leoyang.li@nxp.com, anson.huang@nxp.com,
        Biwen Li <biwen.li@oss.nxp.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        jiafei.pan@nxp.com, Biwen Li <biwen.li@nxp.com>
Subject: Re: (subset) [v2 1/2] rtc: pcf2127: properly set flag WD_CD for rtc chips(pcf2129, pca2129)
Date:   Sat, 13 Feb 2021 22:40:51 +0100
Message-Id: <161325232332.505932.2614858344226096302.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201202031840.15582-1-biwen.li@oss.nxp.com>
References: <20201202031840.15582-1-biwen.li@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 2 Dec 2020 11:18:39 +0800, Biwen Li wrote:
> Properly set flag WD_CD for rtc chips(pcf2129, pca2129)

Applied, thanks!

[1/2] rtc: pcf2127: properly set flag WD_CD for rtc chips(pcf2129, pca2129)
      commit: 2843d565dd78fd9117b9a18567cf68ac37a5dd1e

Finally, I did revert back to your first version, after renaming has_nvmem.

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B10C4432298
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Oct 2021 17:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232363AbhJRPVu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 18 Oct 2021 11:21:50 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:51941 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232852AbhJRPVt (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 18 Oct 2021 11:21:49 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 3878B100004;
        Mon, 18 Oct 2021 15:19:37 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 0/7] rtc: add new ioctl interface and BSM support
Date:   Mon, 18 Oct 2021 17:19:26 +0200
Message-Id: <20211018151933.76865-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This adds a new ioctl interface allowing to get and set extended
parameters on RTCs. While its main goal is to support backup switch
mode, it also intends to fix a long time issue. Until now, it was not
possible to know what features were supported by an RTC before actually
trying to make use of it and see that succeed or fail. In order to make
tests more reliable and allow userspace to take the correct decision,
the features are now exposed.

Changes in v2:
 - Fix rv3032 direct mode value
 - return earlier once BSM is set

Alexandre Belloni (7):
  rtc: add alarm related features
  rtc: add parameter ioctl
  rtc: expose correction feature
  rtc: add correction parameter
  rtc: add BSM parameter
  rtc: rv3028: add BSM support
  rtc: rv3032: allow setting BSM

 drivers/rtc/class.c      |  3 ++
 drivers/rtc/dev.c        | 65 ++++++++++++++++++++++++++++++++++
 drivers/rtc/rtc-rv3028.c | 74 ++++++++++++++++++++++++++++++++++++++
 drivers/rtc/rtc-rv3032.c | 76 ++++++++++++++++++++++++++++++++++++++++
 include/linux/rtc.h      |  2 ++
 include/uapi/linux/rtc.h | 31 +++++++++++++++-
 6 files changed, 250 insertions(+), 1 deletion(-)

-- 
2.31.1


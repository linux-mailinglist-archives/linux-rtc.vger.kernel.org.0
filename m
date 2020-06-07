Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F23FC1F0D40
	for <lists+linux-rtc@lfdr.de>; Sun,  7 Jun 2020 19:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbgFGRGg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 7 Jun 2020 13:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbgFGRGf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 7 Jun 2020 13:06:35 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85776C08C5C3
        for <linux-rtc@vger.kernel.org>; Sun,  7 Jun 2020 10:06:35 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id r16so7247299qvm.6
        for <linux-rtc@vger.kernel.org>; Sun, 07 Jun 2020 10:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=34E19f9KakEuZ3aaVkyGpcW/qNL875P2vwa1aLAM9Jo=;
        b=vCQJYbj0O0LX60XLsijcqtpiXybxjVLaAicMlAG1D32bMDYfKfV/lxcrbs/Ir7m0ay
         qXmUFGGa4pGL7acpvqSeDaClUwGnUt2bBqaneaxNqFh06FgEg1+FVhiNEHSAXDwkr6J2
         TFCdKwRQgxERwNnM2kq/9pKaQBVon4rPkTTUE21KmeDtUmXrt5w7d3u29/8E6qD8Vvs/
         gRjd7fVlinBzMJK2Zo0sRE/rYhGQxUVG68ruSS7Ha4A7AprkJG6+f87yve4fwog4i80V
         ETKSC/OPqWkEEFNl0Xo02tCESfaLkhE6t9vrBxpQIFs4vtu2cInDhOra4S5tJ3H76X4P
         5zVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=34E19f9KakEuZ3aaVkyGpcW/qNL875P2vwa1aLAM9Jo=;
        b=otUYGRGbo3YjCKnEU8CWjl6N763NMcPOie5+E4WEissoezPs5fNyzpX4t7e6XfOi0a
         lqCwKJsxGa6Pkd1inEuGnaQfyVsA+0DY+PN1BTK3liyqWzEV3HcP5v7eEgD/h0haEzZG
         0yKdZ6QIT746yS1qx3Ma5NiXHSFUry4Q9CGXs49BiH1uUGV9XgMBcp5RqimZbHWrbrXP
         FnB0M6eOiScO8u4wDbMI2cURRMA5LhXa4CVxkkd7kYTx28kYiD4DJ9xSXPmTr9hLUwxq
         EySNMW7PYN9OaSGUuC1Jo65eHQqef4J0NGfXoJQcaElUNV3ma+PsZ24ogHWeATQiQgRZ
         qWKQ==
X-Gm-Message-State: AOAM531TWOti2n7uwMKcNW8rlH0BLvLE6RhzWxn2Eygobls6HkNSWJgN
        kzyYj0WkUh/6o4nYH9WtV0kZHF0H
X-Google-Smtp-Source: ABdhPJxko8QugsWqQ173wD69Et0OjySRDd5Hoi7CtiGqOPCAmPSr9Q6S2MkGeI6778wvMQ3VA1qyjA==
X-Received: by 2002:ad4:4841:: with SMTP id t1mr19193642qvy.187.1591549594452;
        Sun, 07 Jun 2020 10:06:34 -0700 (PDT)
Received: from localhost.localdomain (198-48-202-89.cpe.pppoe.ca. [198.48.202.89])
        by smtp.gmail.com with ESMTPSA id p203sm5047088qke.132.2020.06.07.10.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2020 10:06:33 -0700 (PDT)
From:   liambeguin@gmail.com
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linux-rtc@vger.kernel.org
Subject: [PATCH 0/3] rtc: pcf2127: add alarm support
Date:   Sun,  7 Jun 2020 13:06:07 -0400
Message-Id: <20200607170610.24534-1-liambeguin@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Liam Beguin <lvb@xiphos.com>

The board used to test this series has the interrupt line of the RTC
connected to a circuit controlling the power of the board.
An event on the interrupt line while the board is off will power it on.

This was tested on a PCA2129, with:

	$ date "2010-10-10 10:10"
	Sun Oct 10 10:10:00 UTC 2010
	$ /usr/sbin/rtcwake -u -d /dev/rtc0  -s10 --mode off
	[ ... ]
	$ # power on after 10 seconds

Liam Beguin (3):
  rtc: pcf2127: add pca2129 device id
  rtc: pcf2127: add alarm support
  rtc: pcf2127: reset alarm interrupt at power on

 drivers/rtc/rtc-pcf2127.c | 131 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 128 insertions(+), 3 deletions(-)

-- 
2.27.0


Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3471550ED
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Feb 2020 04:18:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727392AbgBGDSV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 6 Feb 2020 22:18:21 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:60208 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbgBGDSV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 6 Feb 2020 22:18:21 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id D8BD9806B7;
        Fri,  7 Feb 2020 16:18:18 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1581045498;
        bh=e/o675tjJdTscKBQQeNil4yXfaUjjIM8MibUsnpCKNM=;
        h=From:To:Cc:Subject:Date;
        b=fUjnZz/tKOLBPq6uRBs4D38mDPlpjKtheG2vU0nsh8fqUSCX+NitjNVEN3xPiw6UV
         qyCyVxJijdc+A9vcvmmHfHZmFUjBrbtyRz/QrF/SqdYGlBBWv00k+s4SQrcD5X16vH
         ApMgcb9I1vttp0N+nO05oBbobFt4smCHLddYLD8rUSEsLg3YtQVZgMLq7lEagHkH4o
         gFC5Pu33KQSToJ7rG8sXRbTZrHI9AhhwHN1KCziBM3bFfyLEOqV0AQUwd/AnqsUsCS
         ALaVBN8KV8YR1IMO5zYrtRNnuqzzyjEVt6bHIicZCqckvIlsPgLc4I/DbtZVcePhKu
         xF09xgaUE9tkg==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5e3cd6fa0000>; Fri, 07 Feb 2020 16:18:18 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 82B9A13EEDE;
        Fri,  7 Feb 2020 16:18:17 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 9D1C628006E; Fri,  7 Feb 2020 16:18:18 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v1 0/2] rtc: update ds1388 support
Date:   Fri,  7 Feb 2020 16:18:10 +1300
Message-Id: <20200207031812.14424-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The ds1388 as a slightly different register layout and watchdog timer
capabilities. Add support for both of these.

Chris Packham (2):
  rtc: ds1307: handle oscillator failure flags for ds1388 variant
  rtc: ds1307: add support for watchdog timer on ds1388

 drivers/rtc/rtc-ds1307.c | 114 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

--=20
2.25.0


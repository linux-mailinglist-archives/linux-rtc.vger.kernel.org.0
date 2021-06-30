Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0FA3B815D
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Jun 2021 13:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234270AbhF3LkD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 30 Jun 2021 07:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234239AbhF3LkD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 30 Jun 2021 07:40:03 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E18A6C061756
        for <linux-rtc@vger.kernel.org>; Wed, 30 Jun 2021 04:37:33 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id g19so4385358ybe.11
        for <linux-rtc@vger.kernel.org>; Wed, 30 Jun 2021 04:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=gxvNEJuP4yzSei9cQBRbSUpph60wmn6OFlrb3uz9jEI=;
        b=TchPM9iS4qN706I+j93wKiIeTfhY47i1P54Zo9M0lfHWmjdJg8/TGTvAxWrY2Ocu1Q
         eW+H2ZdovcbYXktyLVTGmZz39oLteL+HkxzzKMexW3DddtRiQMfrnGZmD9g2st6Kh2Lc
         3JvO0wMM4EEZTPwYnYkisYyZpr/+PCvTrYqFmyKDtOg2QEyvERl1eJJZjAh/D00LVVRv
         Gkd34p4lLCV4Hy0RkCMcj2wYiCRhQN17+6NBvwhMIRTJHUsuz3BZkBs5jKV1GfK9zCNf
         U8DlAa1r4na8oJ71/kv9OnlL31u826UVS7o9aBiJG/vwG+ZaBLKVPPs+ak2qZHV+wgw9
         87mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=gxvNEJuP4yzSei9cQBRbSUpph60wmn6OFlrb3uz9jEI=;
        b=Gdxc2VQ/q5pOIO+H59BgX1Y23A7+Brn9ck/jyl0vzqcqCcVX1tlmxKIJcmw9massie
         LDkBg2OqfuPxC0kAnpuTQ0kQy6vt0ro4U3RDsCDNe35v+vk8yLikW/CwPA9H+f5f3tT/
         SfYD5atBlJ4o6jBQ905gVt8SCAQNVsBIQnVtHqxXvAYrdTFjM2WbIJAGEaxjlv7weZgu
         MDv90jkxhPVl6a8xOPaUZQRXuoeZNclc0NtRDmmBblZaiITHoYT+WBi6a2AniW8QRo9e
         0pqWe9RmY6nIiuKrzZcVCdJr7Lmt0ucjlo/7+tt1OTO6LvD/+/tnXrVebiE8bFszajYV
         w0zQ==
X-Gm-Message-State: AOAM533POpbBE6ZOKgzRGVlLAT2rhtQ3cNef7gKnA622t8HMJeN9SKFh
        zOgjfAoYoahuRO5FLVC5egbZGXGOATbCrFnXwMWszM+cQwc=
X-Google-Smtp-Source: ABdhPJye3SAezEGCFBN6rHL2sQsa6MCg1vJf+Gn2Z8XxoGBpcaQP9Yr8ajUuqxbo0lGkRUskGs9k5IKDjB+IARc4JGM=
X-Received: by 2002:a5b:f02:: with SMTP id x2mr44698149ybr.362.1625053053080;
 Wed, 30 Jun 2021 04:37:33 -0700 (PDT)
MIME-Version: 1.0
From:   Anatoly Pugachev <matorola@gmail.com>
Date:   Wed, 30 Jun 2021 14:37:23 +0300
Message-ID: <CADxRZqxLy3TxY4Qz1CXFxYLmWjbDvKULUnyGaQ2dChD+oe3DDg@mail.gmail.com>
Subject: rtc-test: invalid alarm value
To:     linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello!

Getting the following on kernel boot:

$ journalctl -b -k --no-hostname --utc
...
Jun 30 11:17:24 kernel: rtc-sun4v rtc-sun4v: registered as rtc0
Jun 30 11:17:24 kernel: rtc-sun4v rtc-sun4v: setting system clock to
2021-06-30T11:17:14 UTC (1625051834)
Jun 30 11:17:24 kernel: rtc-test rtc-test.0: registered as rtc1
Jun 30 11:17:24 kernel: rtc rtc2: invalid alarm value:
18446744073704833233-01-06T00:54:29
Jun 30 11:17:24 kernel: rtc-test rtc-test.1: registered as rtc2
Jun 30 11:17:24 kernel: rtc rtc3: invalid alarm value:
18446744073704833233-01-06T00:54:29
Jun 30 11:17:24 kernel: rtc-test rtc-test.2: registered as rtc3

Does it look correct? And if not, how should it work?

Machine is (LDOM) sparc64 debian sid (BE) with kernel
$ uname -a
Linux ttip 5.13.0 #231 SMP Tue Jun 29 16:05:42 MSK 2021 sparc64 GNU/Linux

Kernel boot logs (dmesg) and kernel config available at
https://github.com/mator/sparc64-dmesg/

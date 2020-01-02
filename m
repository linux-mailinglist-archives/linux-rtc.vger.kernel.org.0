Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CBC512E3EB
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Jan 2020 09:40:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727756AbgABIkL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 2 Jan 2020 03:40:11 -0500
Received: from mail-io1-f51.google.com ([209.85.166.51]:34375 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727707AbgABIkL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 2 Jan 2020 03:40:11 -0500
Received: by mail-io1-f51.google.com with SMTP id z193so37614727iof.1
        for <linux-rtc@vger.kernel.org>; Thu, 02 Jan 2020 00:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=SZDlM7C/niti4KoosRclhMSzFjg7ejS8VCi4/M2FqY4=;
        b=PzfAl90t9O12OSROvXm2E+WtA8RanviAZgrLh9o0ioW/ctV9C3APq68WHnv77fnQUo
         Ws5/nlBzOHPpbXMS05QVQfKLAy8y4GdG9RD6HMcUCRfejr+cjE3pm+OdcNjwqSDJ449+
         m9d0/ZYclJnL68nTMypc3C1Fr/DPUFpY5xB9iMRxRhQiLSom6Qj3a1AjqpCZqassZE0Z
         4p1BOAf/+R5gPE9eEqzIm9sXt80fx2DL6qTPtwGkaKeoG6vDOFcUUChRIlhGy+2p0qYo
         3GK9gqZVYIOqeNJHkXKGHSGQmvqyFNh1ZtHnO7J/eYFk66w9FrQIi1wSShL7JwU+GOz3
         lgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=SZDlM7C/niti4KoosRclhMSzFjg7ejS8VCi4/M2FqY4=;
        b=JzkpVq/3ogBcALZTHYY3t4MwIjCf7aUZTmz1hY1Hh0JNFIXHjCDYXxjRLQFxe+VtnK
         V/Szw1E6w93NZ82CItnRfrKle9HcPiVTuUzm3WsMT7eR+XWtBJI26fN4/8ajPQsCcuy1
         vdAh8CI7Th/cn9PQLyXuUovp6UnUlR+XTeOG2Yudy62FKA1MCIh2WCsIz0QM5ybwNwd/
         Ik+sarygfQkYo+6JFTtgnER/2Y8e1Md2YrCUuoFc/2Hw321J1OFB0qNK3N8yK27xwty4
         Y9lBMyoh6HzxotfZ1I89n21a/cfw/hucYxH1k6mJYw4SdIJMv+UBmWUzWSYqB1ZD+zaG
         CpTw==
X-Gm-Message-State: APjAAAWuQ3DcFA50AOUiHCsmJ7zvGuRt6UbdOELnQE/Zh/Enn+8VrtcL
        E/YZt6j+s+gSfxFnfcnMOiNjSXHeUiJaaaEx5Y6txQ==
X-Google-Smtp-Source: APXvYqy1CJRNOamKO4meqNv7aXo6/GbMi3yny9A/FU//+V7KofGiu2cydbFRTs3Yb1PjJ4rbGXxogLuk+Mc10J43df4=
X-Received: by 2002:a6b:6e18:: with SMTP id d24mr55208352ioh.301.1577954411021;
 Thu, 02 Jan 2020 00:40:11 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac0:aafc:0:0:0:0:0 with HTTP; Thu, 2 Jan 2020 00:40:10 -0800 (PST)
From:   JH <jupiter.hce@gmail.com>
Date:   Thu, 2 Jan 2020 19:40:10 +1100
Message-ID: <CAA=hcWQcVi79AW9aOSGQSzEwL-sPwvt=4zR+_25mJKvbkBON1w@mail.gmail.com>
Subject: rtc rtc0: Timeout trying to get valid LPSRT Counter read
To:     linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

I am running kernel 4.19 on imx6, could anyone help for clues what
that error is about? What I could be missing and how to fix it?

Thank you.

Kind regards,

- jh

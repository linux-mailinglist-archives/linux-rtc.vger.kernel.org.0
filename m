Return-Path: <linux-rtc+bounces-20-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7607AE906
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Sep 2023 11:26:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 145311C20356
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Sep 2023 09:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8A012B97;
	Tue, 26 Sep 2023 09:26:44 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060D51849
	for <linux-rtc@vger.kernel.org>; Tue, 26 Sep 2023 09:26:42 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D47CCEB;
	Tue, 26 Sep 2023 02:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1695720401;
  x=1727256401;
  h=references:from:to:subject:date:in-reply-to:message-id:
   mime-version;
  bh=KKq1Mf2cJY9TfY5pJtbvTRqeM251HlM6BFsXNmbjgI4=;
  b=TewbH6+ykYfVgle04rXMVZFdWBFDytnluldLLkZsMPnAeDrbd5xv1htj
   1mH9u3BqxTP1SwjpmbbjMuzMrBpAlDh38I/9tqLDw1bPnJjznn2v2kT5i
   fShAihZfqSM7D1m10k5QB8l4SXmTQt4j2QmNGErxNTJiDtS/qK3NIy7OC
   FmZ8QSrOwwVM/Lkae9xKsx2ZjK3UOAMqw7gkJ4KPDo5qNKUrdZK9Ikkpt
   bChoqWMf+SgTypOBg9/+/DE/SQrAOtGSQP4ZSqchgB5kqCC9RLYFZIykf
   tbPFs/vzW/Cr8mS9ovQ2Sa3jo3BKaDxB5b/m01nr+zIdL8OxL6MfO89lm
   Q==;
References: <cover.1692699931.git.waqar.hameed@axis.com>
 <7b856b74c4c0f8c6c539d7c692051c9203b103c0.1692699931.git.waqar.hameed@axis.com>
User-agent: a.out
From: Waqar Hameed <waqar.hameed@axis.com>
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, <kernel@axis.com>,
	<linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] rtc: Add driver for Epson RX8111
Date: Tue, 26 Sep 2023 11:20:29 +0200
In-Reply-To: <7b856b74c4c0f8c6c539d7c692051c9203b103c0.1692699931.git.waqar.hameed@axis.com>
Message-ID: <pndsf71z3n9.fsf@axis.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail02w.axis.com
 (10.20.40.8)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Aug 22, 2023 at 12:25 +0200 Waqar Hameed <waqar.hameed@axis.com> wrote:

> Epson RX8111 is an RTC with alarm, timer and timestamp functionality.
> Add a basic driver with support for only reading/writing time (for now).
>
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>

Friendly ping incoming!

Please tell if there is anything more needed to be done here. (Or that
the patch will simply not be accepted at all...)


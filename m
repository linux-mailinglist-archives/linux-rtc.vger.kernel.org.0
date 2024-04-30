Return-Path: <linux-rtc+bounces-1080-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F04A58B833D
	for <lists+linux-rtc@lfdr.de>; Wed,  1 May 2024 01:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD2A828307E
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Apr 2024 23:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6620E1C9EB9;
	Tue, 30 Apr 2024 23:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ckLL+yi9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038CF1C8FA7
	for <linux-rtc@vger.kernel.org>; Tue, 30 Apr 2024 23:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714521090; cv=none; b=dWGiKjsfnFHx7PPiERWCFNy7bm9K2KY878Op57c9105GdSUF/xqTkwuLKzx704Mtmzb16Gyitlb1KTFA31gwrRJZXl1kmijy7k3CRnGN3kaaSBD2pldq4RJcMv7f9cfIHDDkTXeT6c6cIWcQgPi7rplYsyr1vqvwZJkgtkB3MHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714521090; c=relaxed/simple;
	bh=4sLsMn+75D63ePKL84qIUrZuVTfpP4Y9iFVCYDx6ZoM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u/1PMIiaxB8AD7vijY3KOxnUR73fIvD5e55+iyg9FlHuNH7VNm5omybdOv31FJWkRK+jbD3Bry3FySX5vZ2tzQbb6nX6J8mO21FNe6dGFIu6Qw6HzSbA6kJv78tdEIJtkQVEMGUWli+2u+7Am4O5yP2/CpCANEJxEPZ5vjaPSuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ckLL+yi9; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2a5d989e820so7119603a91.2
        for <linux-rtc@vger.kernel.org>; Tue, 30 Apr 2024 16:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714521088; x=1715125888; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4sLsMn+75D63ePKL84qIUrZuVTfpP4Y9iFVCYDx6ZoM=;
        b=ckLL+yi9rIZvpky/0YOzu/iCUml5oJ095EDOY2GFeVA3ZS/B0Yvy9ljyyKagzlZu/E
         zWfMYHDP8isZ5t8eRVrUer+buWyO15PpcvkfxvJxXdFAdyDu7tzqqT7J8gzCU8E360BP
         XGQQTPdxpzxQEAn9s+M0sm0gBkYbxgM9EEinCSZh508V3n7ftLZ9Zi9dxDPAAfa/gImy
         WiMHpdJaIm6kBBTwUrPO7e/zKlN2WmJtP+OZK4P/NXZFxcxCTn445CPIsdAKUm4m+H/Z
         ODyPltbvq8jlm7LIoXgefy3g1Top6wefCrXBM9zSf0qAhVXRhRkYjB6ZSwbOZF/d0l1J
         Wlkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714521088; x=1715125888;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4sLsMn+75D63ePKL84qIUrZuVTfpP4Y9iFVCYDx6ZoM=;
        b=iX/OIunNRNTgm+fVXslyVQApACg31HSYpnduUh+VK10pB3uIu8nX5dxraYw6G4rY5a
         kL9Ujno2+rDuuV58pBz7UwoUMyt1AzKSf7HS9EawWpiKa52a0TI3wiybOEWMdbjTufby
         yYCbjViC4TzNqkNOkryFVLhM63db4FAzcejedG+PnQDUlPgsC5oDLR92bbmb33ty0Hb+
         yjv77aNc2BYytaqO6ItoAqTlO8py1D1zB+xq9xLT9EDBPNFRMT4LKVWi6LZ2i1WqCWeN
         7PO44JybQ6Mf+iI79f1UeJL5MVVSdZYeaQhXGt/yIpUWv2f1RDsgErGfU3IRUOwwIcEv
         YzNw==
X-Forwarded-Encrypted: i=1; AJvYcCWyvo383DgWVTy/WFtml7+DM9FiJMRkX3JDB1h4U83MZdhE8Y2ZHAIWLKgtlLV8sk4nD2Xo2LSpAXpCwc+1dPyhUV8cKxap6+rQ
X-Gm-Message-State: AOJu0YyPxPm9ZMmdN63jiESJMlZQk11M+NNH36JZoXpl4+ubqA6iuNBF
	AEhWsNZstWZcwVF9U5Yv3wJ+zK2PUwWUtU0sX0esTyOHuAJUwH9jYuIzgS0Ks46qrYfggV8swro
	yyQ==
X-Google-Smtp-Source: AGHT+IFtSHl2ws+41HKA57TwcS7ukKljLv0iJvc43sJuHvghYmCWKqHkqlRowkQ3pfhszR/h4a+oHj0mSuE=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:dacc:b0:1dd:cc3f:6510 with SMTP id
 q12-20020a170902dacc00b001ddcc3f6510mr6327plx.3.1714521088265; Tue, 30 Apr
 2024 16:51:28 -0700 (PDT)
Date: Tue, 30 Apr 2024 23:50:12 +0000
In-Reply-To: <20240430235057.1351993-1-edliaw@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240430235057.1351993-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.rc0.197.gbae5840b3b-goog
Message-ID: <20240430235057.1351993-4-edliaw@google.com>
Subject: [PATCH v1 03/10] selftests/hid: Compile with -D_GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Bongsu Jeon <bongsu.jeon@samsung.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Edward Liaw <edliaw@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-sound@vger.kernel.org, 
	linux-input@vger.kernel.org, kvm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-sgx@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

809216233555 ("selftests/harness: remove use of LINE_MAX") introduced
asprintf into kselftest_harness.h, which is a GNU extension and needs
_GNU_SOURCE to either be defined prior to including headers or with the
-D_GNU_SOURCE flag passed to the compiler.

Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/hid/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/hid/Makefile b/tools/testing/selftests/hid/Makefile
index 2b5ea18bde38..33170d23315b 100644
--- a/tools/testing/selftests/hid/Makefile
+++ b/tools/testing/selftests/hid/Makefile
@@ -21,7 +21,7 @@ CXX ?= $(CROSS_COMPILE)g++

 HOSTPKG_CONFIG := pkg-config

-CFLAGS += -g -O0 -rdynamic -Wall -Werror -I$(OUTPUT)
+CFLAGS += -g -O0 -rdynamic -Wall -Werror -D_GNU_SOURCE -I$(OUTPUT)
 CFLAGS += -I$(OUTPUT)/tools/include

 LDLIBS += -lelf -lz -lrt -lpthread
--
2.45.0.rc0.197.gbae5840b3b-goog



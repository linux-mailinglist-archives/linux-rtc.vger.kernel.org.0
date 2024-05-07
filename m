Return-Path: <linux-rtc+bounces-1128-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1938BEF25
	for <lists+linux-rtc@lfdr.de>; Tue,  7 May 2024 23:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5BCC1F258A8
	for <lists+linux-rtc@lfdr.de>; Tue,  7 May 2024 21:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71FB15FA83;
	Tue,  7 May 2024 21:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jL8djN5v"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1441F15B12A
	for <linux-rtc@vger.kernel.org>; Tue,  7 May 2024 21:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715118456; cv=none; b=UilAq+AvKZNBhUnLrNiXjp/KcEBuFNbcDpjI01A2OPazc+1B52+pXLue5DpUBrHOmEhwAklK8lNuZ+SCJ7IS3TG1zYizLgEGQgWvim+w/5KUYOGB0FNdXErBkCj1H3RhB3QM0YoN2SWJLzqmAuJbBTNVzhmOkTWDTKEOPxpi6p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715118456; c=relaxed/simple;
	bh=rWVD3Les6HNzGCMpjrx8KhL3+oCBlnrsvxNQZUeaa0A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=S5tmd9TKXMrhW43TxqU77ZX92xzrLDsvAzaTPn/TfPz/EMeR09yvUBL01JLyIoUtjgW3EYvFC6h/xfO9Ho0qdaMufoxNo8od2n0U5DS4VtA3XYWt1fBFJUHlC0qj+butdZYfDh5WZWmxEkp2MeDwUQytpB8FOuWszDtJeFKEF8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jL8djN5v; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-6f454878591so1990315b3a.0
        for <linux-rtc@vger.kernel.org>; Tue, 07 May 2024 14:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715118454; x=1715723254; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GxXvLzcq9DUcgwih3mSAQ78x/pV85qLBcUXkypaveog=;
        b=jL8djN5vEO1m7TfEJ+L81YMFiHGDVolLVgM6fa5VYQ5mX/IYtVDh+74U6/qqObTmiJ
         TGznpSJeelnL0XnJATpD9OKYwW4HcBEy1z6iLfyy4XigP7CDqBXeQVB4iZWUyVAaR8ul
         HygKiUy+MquSUbKGVV0Yy3+/sjMqKsWKsORp27ZuE5ZT2uCMb7q0Ab+auS1b/Eo4KbxS
         0VgZyg4Cu3vh+Nud0IkyWZ1h3I5EUMMpbE79VNLZV5bg86NyetkRNO2JGQsA3Mv7Q3CO
         RQfRjJ43cqv26Y7CDw+l7cn6dUYEdkAnCOIHYaR9Ksq978wQ99DLauRRXD66BI8m90Nr
         BFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715118454; x=1715723254;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GxXvLzcq9DUcgwih3mSAQ78x/pV85qLBcUXkypaveog=;
        b=SF/PYgfoq8C+EZcFQEOmDFsG5G7EZh8rcR+2k4qKh+KthmBk0ysbRTNBipNMSIXo/P
         DBT4q0XOokTCCtdxgEPa/q4XNwMz45MWy1n/o5XJVLzEt4bOlqQnSUxqh0WKhjjFt5Gt
         EKNlk5nM19QAxQfmSZ30rlDykBVB3Bc+KqIkKQ46EWLZmY4O+wAcAxxl7Scqm/P1UjX+
         Mkx9dboaMRfOQ52AN63yyr4cJcDxD7oefSa4hO2xSRpU296TGuSLo+Wa+r3nOG3k2Ww9
         yB1b8CfLLlHijO5R8kgeMGmbt7OkdlM4JD1nS9QudrfY+B5GbJODdmutgu+93O65xNj8
         yXFg==
X-Forwarded-Encrypted: i=1; AJvYcCXSszrAhGp7SwP4gMGlEMxiigI0eIo3YkSL3tRrpKquPrbDTTRQK18/TW4qkdDQM4cZVD9wejwCkyHjv606lGTBHH9p5fGacgnf
X-Gm-Message-State: AOJu0YwWu2FG4IQSH2KnPDCtglaBDJO1lnspp4obwuUN2MmRhHWxip6P
	QOYVHNyGUpwaCLbFS0SB39rdAHoFs6WojlHhztJVhW6n8ihnmOapkBBBCfRl6GwAEqD5iwLCCI9
	AjQ==
X-Google-Smtp-Source: AGHT+IGyIuHby3YDnVxOzNzbbaEdY9qKdq7MpmWxi3fRJ7Znvf9dmfYdSTbgOYiGfgZmNPwJBeWALvgDPEM=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:1803:b0:6ec:f406:ab4b with SMTP id
 d2e1a72fcca58-6f49c30a0e9mr48385b3a.4.1715118454141; Tue, 07 May 2024
 14:47:34 -0700 (PDT)
Date: Tue,  7 May 2024 21:38:30 +0000
In-Reply-To: <20240507214254.2787305-1-edliaw@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240507214254.2787305-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240507214254.2787305-6-edliaw@google.com>
Subject: [PATCH v2 5/5] selftests: Drop duplicate -D_GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Christian Brauner <brauner@kernel.org>, Eric Biederman <ebiederm@xmission.com>, 
	Kees Cook <keescook@chromium.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, 
	Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	David Hildenbrand <david@redhat.com>, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Seth Forshee <sforshee@kernel.org>, 
	Bongsu Jeon <bongsu.jeon@samsung.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"=?UTF-8?q?Andreas=20F=C3=A4rber?=" <afaerber@suse.de>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Matthieu Baerts <matttbe@kernel.org>, Mat Martineau <martineau@kernel.org>, 
	Geliang Tang <geliang@kernel.org>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	Fenghua Yu <fenghua.yu@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Edward Liaw <edliaw@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-input@vger.kernel.org, iommu@lists.linux.dev, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-security-module@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-actions@lists.infradead.org, mptcp@lists.linux.dev, 
	linux-rtc@vger.kernel.org, linux-sgx@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

-D_GNU_SOURCE can be de-duplicated here, as it is added by
KHDR_INCLUDES.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/futex/functional/Makefile | 2 +-
 tools/testing/selftests/iommu/Makefile            | 2 --
 tools/testing/selftests/net/tcp_ao/Makefile       | 2 +-
 tools/testing/selftests/resctrl/Makefile          | 2 +-
 4 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/Makefile b/tools/testing/selftests/futex/functional/Makefile
index a392d0917b4e..f79f9bac7918 100644
--- a/tools/testing/selftests/futex/functional/Makefile
+++ b/tools/testing/selftests/futex/functional/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 INCLUDES := -I../include -I../../ $(KHDR_INCLUDES)
-CFLAGS := $(CFLAGS) -g -O2 -Wall -D_GNU_SOURCE -pthread $(INCLUDES) $(KHDR_INCLUDES)
+CFLAGS := $(CFLAGS) -g -O2 -Wall -pthread $(INCLUDES) $(KHDR_INCLUDES)
 LDLIBS := -lpthread -lrt
 
 LOCAL_HDRS := \
diff --git a/tools/testing/selftests/iommu/Makefile b/tools/testing/selftests/iommu/Makefile
index 32c5fdfd0eef..fd6477911f24 100644
--- a/tools/testing/selftests/iommu/Makefile
+++ b/tools/testing/selftests/iommu/Makefile
@@ -2,8 +2,6 @@
 CFLAGS += -Wall -O2 -Wno-unused-function
 CFLAGS += $(KHDR_INCLUDES)
 
-CFLAGS += -D_GNU_SOURCE
-
 TEST_GEN_PROGS :=
 TEST_GEN_PROGS += iommufd
 TEST_GEN_PROGS += iommufd_fail_nth
diff --git a/tools/testing/selftests/net/tcp_ao/Makefile b/tools/testing/selftests/net/tcp_ao/Makefile
index 522d991e310e..c608b1ec02e6 100644
--- a/tools/testing/selftests/net/tcp_ao/Makefile
+++ b/tools/testing/selftests/net/tcp_ao/Makefile
@@ -26,7 +26,7 @@ LIB	:= $(LIBDIR)/libaotst.a
 LDLIBS	+= $(LIB) -pthread
 LIBDEPS	:= lib/aolib.h Makefile
 
-CFLAGS	:= -Wall -O2 -g -D_GNU_SOURCE -fno-strict-aliasing
+CFLAGS	:= -Wall -O2 -g -fno-strict-aliasing
 CFLAGS	+= $(KHDR_INCLUDES)
 CFLAGS	+= -iquote ./lib/ -I ../../../../include/
 
diff --git a/tools/testing/selftests/resctrl/Makefile b/tools/testing/selftests/resctrl/Makefile
index 2deac2031de9..5073dbc96125 100644
--- a/tools/testing/selftests/resctrl/Makefile
+++ b/tools/testing/selftests/resctrl/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-CFLAGS = -g -Wall -O2 -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE
+CFLAGS = -g -Wall -O2 -D_FORTIFY_SOURCE=2
 CFLAGS += $(KHDR_INCLUDES)
 
 TEST_GEN_PROGS := resctrl_tests
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog



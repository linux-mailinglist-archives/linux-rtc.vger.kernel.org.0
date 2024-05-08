Return-Path: <linux-rtc+bounces-1152-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 072E78C0411
	for <lists+linux-rtc@lfdr.de>; Wed,  8 May 2024 20:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56072B24B19
	for <lists+linux-rtc@lfdr.de>; Wed,  8 May 2024 18:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9631112E1E5;
	Wed,  8 May 2024 18:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MDO9ZEE/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4334612BF3A
	for <linux-rtc@vger.kernel.org>; Wed,  8 May 2024 18:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715191421; cv=none; b=ZD9yoEwhQYjJK6iHXx5vHXmBMVyFLv2BZEpRwtzrDfzg4G/tNMjhYxSHrYbHpcUMZJOola7p9OazNuWZConbCeha1qBzf/AAE80nP5DuE9f4HQqTwYbrTULQPmuqKiovPoePYB5abjiCC3zUDOiUMeALWXh0+z7dX48TYGSqcbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715191421; c=relaxed/simple;
	bh=QnIGcOGbV4cqrx4Nx/huveAV3Zfk93aDR5GKJzn4mog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KmCKqt78tvFD/eQgKE+Ql+GV+fGXYC9jXvzh6T7rDJD7LczEeqmYzn/Zissx9Pet7LfA2NK44FXtLQwClHJqXj0R5AMqRNg/Ivz/rcna0jTppeAJHcFUJpbL+ya1PGYRtMvkRdHVe1mWaxUmeDJAMV2wbz882gp+QZ6gLrNDYQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MDO9ZEE/; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-572a1b3d6baso1760a12.1
        for <linux-rtc@vger.kernel.org>; Wed, 08 May 2024 11:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715191417; x=1715796217; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKy0w8SAVZYo27FpU6ZBovVv7b8KWTwyUtyfvoxHua4=;
        b=MDO9ZEE/likR2ckWoxMuwmX5XuJpo/MliTsQTLkYJvbAeHL7DxxsuckjkF+BmCoheE
         nI4TPXOaddA+VAPpry4jgJ9TZFm+fGpdlUFbCe2Hi5OVLXB26jgay0ATo1UKiat4DSXc
         7bNIY1d42xd0bQ1Hmuaa19nXyq1uclJVNa+e8jY55trNWJ1W5XuERkT+FNKxQuUMd/HB
         EbWcEX0XqZKEAlBapGeXFyJFxLvpGmMutsDTLwezfrn9SEcHRVMhSc27h2ibw+GEGdSO
         4AedWVLB7yZgKERzgE2wVJhpiAZv8prVhJ7E9w/BlZQyf71jLfj8hbSJSUqzrxBgTrRL
         d+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715191417; x=1715796217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKy0w8SAVZYo27FpU6ZBovVv7b8KWTwyUtyfvoxHua4=;
        b=nkGjVS1E3BjuKeXB9KamP+RqIK/IEGBokOTziAgnfNw/0Tbbr36O3ibRyqGr7AxRUp
         3AA5BxEYzbCa5by6TYMdXxirSpO835iMYjvNNoobj0QJlAB1dDXvpdmkYxzB9lTGl8Ef
         7bs59IcrS0xpLCb4ZpplAoE7FnXUkSr2BbJaIZcNftV6lbRToRN+jfJFE5yNuWcKPdEd
         jhs55CqOHvGC/LEppct53L2J/RmoO4QhhZ0xhfjs0um7pIwMPXX7BGb4rHurIxwSBp19
         glC+L7c+3G+N1FIc8EihWAVwOSxDRsK7NTTNr6pZRQj0DM7zPw3JzVDQ96DZ9TF6D/Jp
         rLqw==
X-Forwarded-Encrypted: i=1; AJvYcCWRPYVDyBz2U5Ec+8d+Va8NC97HX4LqhiP+Lh/IXrWG2om7kPIvUpUndnG79y4aDC2paKOi1EPvbh/fxTqQY2Bp2E+WPbhwVU11
X-Gm-Message-State: AOJu0Yxn8KueupBThAmcqJ4EdEOgQtYq+Ee8RmTZ5fZsq5x2yip8qVMT
	8DUiblRgPI10bPm9sM8u+1kE756Hmtlu6jzAqZ3ThVUWl3j3gUZWwyJj1LSe7T1ctk4pI5CMA9s
	dyLO3ANBiq1+qi2MDEHcILlf12v52Q9TnNyDP
X-Google-Smtp-Source: AGHT+IFdyxKHKBA5RxjNJeg0nvw+PuOv0TpVA43qYYBbq4FC0UUJLuiCzYnH7rV9IAgiFwYJSHM5Q/yPLhYa7GrUbHY=
X-Received: by 2002:a05:6402:1763:b0:572:554b:ec66 with SMTP id
 4fb4d7f45d1cf-57334b922acmr1088a12.3.1715191416289; Wed, 08 May 2024 11:03:36
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507214254.2787305-1-edliaw@google.com> <ZjuA3aY_iHkjP7bQ@google.com>
In-Reply-To: <ZjuA3aY_iHkjP7bQ@google.com>
From: Edward Liaw <edliaw@google.com>
Date: Wed, 8 May 2024 11:03:07 -0700
Message-ID: <CAG4es9V1578h2EgpztcoEv3CPGftbgA+HNfhgaPxBqOxP6-CrQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Define _GNU_SOURCE for sources using
To: Sean Christopherson <seanjc@google.com>
Cc: shuah@kernel.org, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Christian Brauner <brauner@kernel.org>, Eric Biederman <ebiederm@xmission.com>, 
	Kees Cook <keescook@chromium.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Kevin Tian <kevin.tian@intel.com>, Andy Lutomirski <luto@amacapital.net>, 
	Will Drewry <wad@chromium.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	David Hildenbrand <david@redhat.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Seth Forshee <sforshee@kernel.org>, Bongsu Jeon <bongsu.jeon@samsung.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Matthieu Baerts <matttbe@kernel.org>, 
	Mat Martineau <martineau@kernel.org>, Geliang Tang <geliang@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Fenghua Yu <fenghua.yu@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team@android.com, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, linux-input@vger.kernel.org, iommu@lists.linux.dev, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-security-module@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-actions@lists.infradead.org, mptcp@lists.linux.dev, 
	linux-rtc@vger.kernel.org, linux-sgx@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 8, 2024 at 6:47=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Tue, May 07, 2024, Edward Liaw wrote:
> > 809216233555 ("selftests/harness: remove use of LINE_MAX") introduced
> > asprintf into kselftest_harness.h, which is a GNU extension and needs
> > _GNU_SOURCE to either be defined prior to including headers or with the
> > -D_GNU_SOURCE flag passed to the compiler.
> >
> > v1: https://lore.kernel.org/linux-kselftest/20240430235057.1351993-1-ed=
liaw@google.com/
> > v2: add -D_GNU_SOURCE to KHDR_INCLUDES so that it is in a single
> > location.  Remove #define _GNU_SOURCE from source code to resolve
> > redefinition warnings.
> >
> > Edward Liaw (5):
> >   selftests: Compile kselftest headers with -D_GNU_SOURCE
> >   selftests/sgx: Include KHDR_INCLUDES in Makefile
> >   selftests: Include KHDR_INCLUDES in Makefile
> >   selftests: Drop define _GNU_SOURCE
> >   selftests: Drop duplicate -D_GNU_SOURCE
>
> Can you rebase this on top of linux-next?  I have a conflicting fix[*] fo=
r the
> KVM selftests queued for 6.10, and I would prefer not to drop that commit=
 at
> this stage as it would require a rebase of a pile of other commits.

Ok, I'll do that.

>
> And I doubt KVM is the only subsystem that has a targeted fix for the _GN=
U_SOURCE
> mess.
>
> If we want/need to get a fix into 6.9, then IMO we should just revert 809=
216233555
> ("selftests/harness: remove use of LINE_MAX"), as that came in quite late=
 in the
> 6.9 cycle, and I don't think it's feasible to be 100% confident that glob=
ally
> defining _GNU_SOURCE works for all selftests, i.e. we really should have =
a full
> cycle for folks to test.

That sounds reasonable to me.  In this thread Tao suggested reverting
back to 809216233555 and using a fixed value in place of LINE_MAX to
fix 38c957f07038
https://lore.kernel.org/linux-kselftest/20240508070003.2acdf9b4@kernel.org/

>
> [*] https://github.com/kvm-x86/linux/commit/730cfa45b5f4

